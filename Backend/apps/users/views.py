"""
users/views.py

Swagger tag strategy:
    Auth - User         — User register / login
    Auth - Admin        — admin login
    Auth - Shared       — logout, password change, password reset (both roles)
    Auth - OAuth        — Google / Apple OAuth
    Profile - User      — own profile read/update etc.
    Profile - Admin     — admin's own profile read/update
    Admin - Users       — admin viewing/managing platform users
"""

import logging

from django.contrib.auth import get_user_model
from django.db.models import Q
from drf_spectacular.utils import (
    OpenApiParameter,
    OpenApiResponse,
    extend_schema,
    extend_schema_view,
    inline_serializer,
)
from rest_framework import serializers as drf_serializers
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.filters import OrderingFilter, SearchFilter
from rest_framework.parsers import FormParser, JSONParser, MultiPartParser
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from django_filters.rest_framework import DjangoFilterBackend

from notifications.services import NotificationTemplates

from .models import *
from .permissions import *
from .serializers import *
from .services import *

logger = logging.getLogger(__name__)
User = get_user_model()


# ─────────────────────────────────────────────────────────────────────────────
# Internal helpers
# ─────────────────────────────────────────────────────────────────────────────

def _token_response(user, request=None) -> dict:
    """Standard login/register success payload."""
    refresh = RefreshToken.for_user(user)
    return {
        "access_token":  str(refresh.access_token),
        "refresh_token": str(refresh),
        "user":          UserProfileSerializer(user, context={"request": request}).data,
    }


def _handle_registration_complete(user, request=None) -> None:
    """Fire post-registration side effects — non-blocking."""
    try:
        from users.tasks import send_welcome_email
        send_welcome_email.delay(user.email, user.full_name)
        NotificationTemplates.welcome(user)
        NotificationTemplates.new_user_joined(user)
    except Exception:
        logger.exception("Post-registration hooks failed for %s", user.email)


# Inline response schemas — reused across multiple Swagger docs
_otp_sent_response = inline_serializer(
    name="OTPSentResponse",
    fields={
        "message":            drf_serializers.CharField(),
        "email":              drf_serializers.EmailField(),
        "expires_in_seconds": drf_serializers.IntegerField(),
    },
)

_message_response = inline_serializer(
    name="MessageResponse",
    fields={"message": drf_serializers.CharField()},
)

_token_response_schema = inline_serializer(
    name="TokenResponse",
    fields={
        "message":       drf_serializers.CharField(),
        "access_token":  drf_serializers.CharField(),
        "refresh_token": drf_serializers.CharField(),
        "user":          UserProfileSerializer(),
    },
)

_admin_login_response_schema = inline_serializer(
    name="AdminLoginResponse",
    fields={
        "message":       drf_serializers.CharField(),
        "access_token":  drf_serializers.CharField(),
        "refresh_token": drf_serializers.CharField(),
        "user":          AdminProfileSerializer(),
    },
)



# ═══════════════════════════════════════════════════════════════════════════════
# USER REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(tags=["Auth - User"])
class UserInitiateRegistrationView(APIView):
    """
    **Step 1** — Validate fields, send OTP to email.
    Accessible to: Unauthenticated.
    """
    permission_classes = [AllowAny]

    @extend_schema(
        summary="User — Initiate registration (send OTP)",
        description=(
            "Validates email uniqueness and password strength, then sends a 6-digit OTP. "
            "`confirm_password` is validated at this step."
        ),
        request=InitiateRegistrationSerializer,
        responses={
            200: _otp_sent_response,
            400: OpenApiResponse(description="Validation error."),
        },
    )
    def post(self, request):
        serializer = InitiateRegistrationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        d = serializer.validated_data
        try:
            result = RegistrationService.initiate_registration(
                email=d["email"],
                password=d["password"],
                full_name=d["full_name"],
            )
            return Response(result, status=status.HTTP_200_OK)
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
        except Exception:
            logger.exception("User registration initiation failed.")
            return Response({"error": "Something went wrong. Please try again."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@extend_schema(tags=["Auth - User"])
class UserVerifyRegistrationView(APIView):
    """
    **Step 2** — Verify OTP → create User account → return JWT tokens.
    Accessible to: Unauthenticated.
    """
    permission_classes = [AllowAny]

    @extend_schema(
        summary="User — Verify OTP & complete registration",
        description=(
            "Validates the OTP submitted by the user. On success, creates the User account, "
            "and returns JWT tokens."
        ),
        request=VerifyRegistrationOTPSerializer,
        responses={
            201: _token_response_schema,
            400: OpenApiResponse(description="Invalid or expired OTP."),
        },
    )
    def post(self, request):
        serializer = VerifyRegistrationOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        d = serializer.validated_data
        try:
            result = RegistrationService.verify_and_complete_registration(
                email=d["email"], otp=d["otp"],
            )
            user = result["user"]
            _handle_registration_complete(user, request)
            return Response(
                {
                    "message":       "Registration successful! Welcome to AMM.",
                    "access_token":  result["access_token"],
                    "refresh_token": result["refresh_token"],
                    "user":          UserProfileSerializer(user, context={"request": request}).data,
                },
                status=status.HTTP_201_CREATED,
            )
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
        except Exception:
            logger.exception("OTP verification failed.")
            return Response({"error": "Something went wrong. Please try again."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


# ═══════════════════════════════════════════════════════════════════════════════
# RESEND OTP  (shared across all registration flows)
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(tags=["Auth - Shared"])
class ResendRegistrationOTPView(APIView):
    """
    Resend OTP during the registration flow.
    Requires step 1 to have already been called (session must exist in Redis).
    Accessible to: Unauthenticated.
    """
    permission_classes = [AllowAny]

    @extend_schema(
        summary="Resend registration OTP",
        description=(
            "Resends a fresh OTP for an in-progress registration session. "
            "The registration session (from step 1) must still be active in Redis."
        ),
        request=ResendOTPSerializer,
        responses={
            200: _otp_sent_response,
            400: OpenApiResponse(description="Session expired or invalid role."),
        },
    )
    def post(self, request):
        serializer = ResendOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        try:
            result = RegistrationService.resend_otp(
                role=role,
                email=serializer.validated_data["email"],
            )
            return Response(result, status=status.HTTP_200_OK)
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


# ═══════════════════════════════════════════════════════════════════════════════
# LOGIN VIEWS
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(
    tags=["Auth - User"],
    summary="User — Login",
    description="Authenticate an user. Returns JWT access + refresh tokens.",
    request=UserLoginSerializer,
    responses={
        200: _token_response_schema,
        400: OpenApiResponse(description="Invalid credentials or wrong role."),
    },
)
class UserLoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = UserLoginSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data["user"]
        return Response(
            {"message": "Logged in successfully.", **_token_response(user, request)},
            status=status.HTTP_200_OK,
        )



@extend_schema(
    tags=["Auth - Admin"],
    request=AdminLoginSerializer,
    summary="Admin — Dashboard login",
    responses={200: AdminProfileSerializer},
)
class AdminLoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = AdminLoginSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data["user"]
        return Response(
            {"message": f"Welcome back, {user.full_name}.", **_token_response(user, request)},
            status=status.HTTP_200_OK,
        )
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
        except Exception:
            logger.exception("Admin Login failed.")
            return Response({"error": "Something went wrong. Please try again."}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)



# ═══════════════════════════════════════════════════════════════════════════════
# OAUTH  (Users)
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(
    tags=["Auth - OAuth"],
    summary="Google — OAuth login / register",
    description=(
        "Pass a Google ID token (from Firebase or direct Google Sign-In). Creates the account on first call; logs in on subsequent calls. "
        "Admins cannot use OAuth registration."
    ),
    request=GoogleOAuthSerializer,
    responses={
        200: _token_response_schema,
        400: OpenApiResponse(description="Invalid token or email conflict."),
    },
)
class GoogleOAuthView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = GoogleOAuthSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.validated_data, status=status.HTTP_200_OK)


@extend_schema(
    tags=["Auth - OAuth"],
    summary="Apple — OAuth login / register",
    description=(
        "Pass an Apple ID token, optional `user` dict (Apple sends this only on first login), "
        "Admins cannot use OAuth registration."
    ),
    request=AppleOAuthSerializer,
    responses={
        200: _token_response_schema,
        400: OpenApiResponse(description="Invalid token or email conflict."),
    },
)
class AppleOAuthView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = AppleOAuthSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.validated_data, status=status.HTTP_200_OK)


# ═══════════════════════════════════════════════════════════════════════════════
# SHARED AUTH  (all roles)
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(
    tags=["Auth - Shared"],
    summary="Logout",
    description=(
        "Blacklists the refresh token, invalidating the session. "
        "Pass `refresh` token in the request body. Available to both authenticated roles."
    ),
    request=inline_serializer(
        name="LogoutRequest",
        fields={"refresh": drf_serializers.CharField()},
    ),
    responses={
        205: OpenApiResponse(description="Logged out successfully."),
        400: OpenApiResponse(description="Invalid or missing refresh token."),
    },
)
class LogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            refresh_token = request.data.get("refresh")
            if refresh_token:
                RefreshToken(refresh_token).blacklist()
            return Response({"message": "Logged out successfully."}, status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


@extend_schema(
    tags=["Auth - Shared"],
    summary="Change password",
    description=(
        "Change password for the currently authenticated user. "
        "Available to both authenticated roles."
    ),
    request=ChangePasswordSerializer,
    responses={
        200: _message_response,
        400: OpenApiResponse(description="Incorrect current password or validation error."),
    },
)
class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = request.user
        user.set_password(serializer.validated_data["new_password"])
        user.save(update_fields=["password"])
        try:
            NotificationTemplates.password_changed(user)
        except Exception:
            logger.exception("Password changed notification failed for %s", user.email)
        return Response({"message": "Password changed successfully."}, status=status.HTTP_200_OK)


@extend_schema(
    tags=["Auth - Shared"],
    summary="Forgot password — Step 1: Send OTP",
    description=(
        "Sends a password reset OTP to the email address if it is registered. "
        "Always returns the same response to prevent email enumeration."
    ),
    request=InitiatePasswordResetSerializer,
    responses={200: _otp_sent_response},
)
class InitiatePasswordResetView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = InitiatePasswordResetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = PasswordResetService.initiate_password_reset(
            email=serializer.validated_data["email"]
        )
        return Response(result, status=status.HTTP_200_OK)


@extend_schema(
    tags=["Auth - Shared"],
    summary="Forgot password — Step 2: Verify OTP",
    description=(
        "Validates the OTP and returns a one-time `reset_token`. "
        "Pass this token to the confirm endpoint to set a new password."
    ),
    request=VerifyPasswordResetOTPSerializer,
    responses={
        200: inline_serializer(
            name="VerifyOTPResponse",
            fields={
                "reset_token":        drf_serializers.CharField(),
                "message":            drf_serializers.CharField(),
                "expires_in_seconds": drf_serializers.IntegerField(),
            },
        ),
        400: OpenApiResponse(description="Invalid or expired OTP."),
    },
)
class VerifyPasswordResetOTPView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = VerifyPasswordResetOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        try:
            result = PasswordResetService.verify_reset_otp(
                email=serializer.validated_data["email"],
                otp=serializer.validated_data["otp"],
            )
            return Response(result, status=status.HTTP_200_OK)
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


@extend_schema(
    tags=["Auth - Shared"],
    summary="Forgot password — Step 3: Set new password",
    description=(
        "Sets a new password using the `reset_token` returned from step 2. "
        "The token is single-use and expires after `PASSWORD_RESET_TOKEN_EXPIRY_SECONDS`."
    ),
    request=ResetPasswordSerializer,
    responses={
        200: _message_response,
        400: OpenApiResponse(description="Invalid/expired reset token or password mismatch."),
    },
)
class ResetPasswordView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = ResetPasswordSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        try:
            result = PasswordResetService.reset_password(
                reset_token=serializer.validated_data["reset_token"],
                new_password=serializer.validated_data["new_password"],
            )
            user = result.get("user")
            if user:
                try:
                    NotificationTemplates.password_changed(user)
                except Exception:
                    logger.exception("Password reset notification failed for %s", user.email)
            return Response({"message": result["message"]}, status=status.HTTP_200_OK)
        except ValueError as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)


# ═══════════════════════════════════════════════════════════════════════════════
# USER PROFILE  
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(tags=["Profile - User"])
class UserProfileView(APIView):
    """
    GET  — Retrieve own full profile (owner only).
    PATCH — Update editable profile fields (first_name, last_name,device_token).
    Available to: Users
    """
    # permission_classes = [IsNormalUser] # TODO: update it after modifying permissions.py
    parser_classes     = [MultiPartParser, FormParser, JSONParser]

    @extend_schema(
        summary="Get my profile",
        description=(
            "Returns the full profile of the authenticated user including "
            "codename, subscription plan, and last active display. "
            "Available to Users"
        ),
        responses={200: UserProfileSerializer},
    )
    def get(self, request):
        serializer = UserProfileSerializer(request.user, context={"request": request})
        return Response(serializer.data, status=status.HTTP_200_OK)

    @extend_schema(
        summary="Update my profile",
        description=(
            "Update editable profile fields: `first_name`, `last_name`, `device_token`. "
            "To update profile picture use the dedicated `/profile/picture/` endpoint. "
            "Role, email, codename, and subscription are not editable here."
        ),
        request=UpdateProfileSerializer,
        responses={200: UserProfileSerializer},
    )
    def patch(self, request):
        serializer = UpdateProfileSerializer(
            request.user, data=request.data, partial=True, context={"request": request}
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(
            UserProfileSerializer(request.user, context={"request": request}).data,
            status=status.HTTP_200_OK,
        )

    @extend_schema(
        summary="Delete my profile",
        description=(
            "Permanently deletes the authenticated user's own profile and account. "
            "This action is irreversible."
        ),
        responses={204: OpenApiResponse(description="Profile deleted.")},
    )
    def delete(self, request):
        request.user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# ═══════════════════════════════════════════════════════════════════════════════
# ADMIN PROFILE
# ═══════════════════════════════════════════════════════════════════════════════

@extend_schema(tags=["Profile - Admin"])
class AdminProfileView(APIView):
    """
    GET  — Retrieve own admin profile.
    PATCH — Update first_name, last_name, profile_picture.
    Available to: Matchmaker, Superadmin.
    """
    permission_classes = [IsAdminUser]
    parser_classes     = [MultiPartParser, FormParser, JSONParser]

    @extend_schema(
        summary="Admin — Get my profile",
        description="Returns the authenticated admin's own profile with member_since info.",
        responses={200: AdminProfileSerializer},
    )
    def get(self, request):
        serializer = AdminProfileSerializer(request.user, context={"request": request})
        return Response(serializer.data, status=status.HTTP_200_OK)

    @extend_schema(
        summary="Admin — Update my profile",
        description="Update `first_name`, `last_name`, and/or `profile_picture`. Email and role are not editable.",
        request=AdminProfileSerializer,
        responses={200: AdminProfileSerializer},
    )
    def patch(self, request):
        serializer = AdminProfileSerializer(
            request.user, data=request.data, partial=True, context={"request": request}
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)


# ═══════════════════════════════════════════════════════════════════════════════
# ADMIN — USER MANAGEMENT
# ═══════════════════════════════════════════════════════════════════════════════

# TODO: Need to add swagger schema
class AdminUserViewSet(viewsets.ReadOnlyModelViewSet):
    """
    Need to add view here
    """
    # permission_classes = [IsAdminUser]
    # serializer_class   = AdminUserListSerializer
    # filter_backends    = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    # search_fields      = ["full_name", "email"]
    # ordering_fields    = ["created_at"]
    # ordering           = ["-created_at"]
    pass

    
