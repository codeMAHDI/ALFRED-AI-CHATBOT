"""
Views for user authentication, profile management, and basic admin user access.
"""

from rest_framework import status, viewsets
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import User
from .permissions import IsAdminUser
from .serializers import (
    AdminProfileSerializer,
    AdminProfileUpdateSerializer,
    AdminUserSerializer,
    AppleOAuthSerializer,
    ChangePasswordSerializer,
    GoogleOAuthSerializer,
    InitiatePasswordResetSerializer,
    InitiateRegistrationSerializer,
    LoginSerializer,
    RefreshTokenSerializer,
    ResendOTPSerializer,
    ResetPasswordSerializer,
    UpdateProfileSerializer,
    UserProfileSerializer,
    VerifyPasswordResetOTPSerializer,
    VerifyRegistrationOTPSerializer,
)
from .services import AuthService, PasswordResetService, RegistrationService


def success_response(message: str, data=None, status_code=status.HTTP_200_OK):
    return Response(
        {
            "success": True,
            "message": message,
            "data": data or {},
        },
        status=status_code,
    )


def perform_service_call(callback, *args, **kwargs):
    try:
        return callback(*args, **kwargs)
    except ValueError as exc:
        raise ValidationError({"detail": str(exc)})


class UserInitiateRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = InitiateRegistrationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        payload = serializer.validated_data.copy()
        payload.pop("confirm_password", None)
        result = perform_service_call(
            RegistrationService.initiate_registration,
            **payload,
        )
        return success_response(result["message"], result)


class UserVerifyRegistrationView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = VerifyRegistrationOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            RegistrationService.verify_and_complete_registration,
            request=request,
            **serializer.validated_data,
        )
        return success_response(
            "Registration completed successfully.",
            result,
            status.HTTP_201_CREATED,
        )


class ResendRegistrationOTPView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = ResendOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            RegistrationService.resend_otp,
            **serializer.validated_data,
        )
        return success_response(result["message"], result)


class UserLoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = perform_service_call(
            AuthService.authenticate_user,
            **serializer.validated_data,
        )
        payload = AuthService.create_auth_payload(user, request=request)
        return success_response("Login successful.", payload)


class AdminLoginView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = perform_service_call(
            AuthService.authenticate_user,
            require_admin=True,
            **serializer.validated_data,
        )
        payload = AuthService.create_auth_payload(user, request=request)
        return success_response("Admin login successful.", payload)


class LogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = RefreshTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        perform_service_call(
            AuthService.logout,
            serializer.validated_data["refresh_token"],
        )
        return success_response("Logout successful.")


class ChangePasswordView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data, context={"request": request})
        serializer.is_valid(raise_exception=True)
        perform_service_call(
            AuthService.change_password,
            request.user,
            serializer.validated_data["new_password"],
        )
        return success_response("Password changed successfully.")


class InitiatePasswordResetView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = InitiatePasswordResetSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            PasswordResetService.initiate_password_reset,
            serializer.validated_data["email"]
        )
        return success_response(result["message"], result)


class VerifyPasswordResetOTPView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = VerifyPasswordResetOTPSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            PasswordResetService.verify_reset_otp,
            **serializer.validated_data,
        )
        return success_response(result["message"], result)


class ResetPasswordView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = ResetPasswordSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            PasswordResetService.reset_password,
            serializer.validated_data["reset_token"],
            serializer.validated_data["new_password"],
        )
        return success_response(result["message"])


class GoogleOAuthView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = GoogleOAuthSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            AuthService.login_with_google,
            serializer.validated_data["id_token"],
            request=request,
        )
        return success_response("Google login successful.", result)


class AppleOAuthView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = AppleOAuthSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        result = perform_service_call(
            AuthService.login_with_apple,
            serializer.validated_data["id_token"],
            user_data=serializer.validated_data.get("user"),
            request=request,
        )
        return success_response("Apple login successful.", result)


class UserProfileView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        serializer = UserProfileSerializer(request.user, context={"request": request})
        return success_response("Profile retrieved successfully.", serializer.data)

    def patch(self, request):
        serializer = UpdateProfileSerializer(
            request.user,
            data=request.data,
            partial=True,
            context={"request": request},
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()
        profile_serializer = UserProfileSerializer(
            request.user,
            context={"request": request},
        )
        return success_response("Profile updated successfully.", profile_serializer.data)


class AdminProfileView(APIView):
    permission_classes = [IsAuthenticated, IsAdminUser]

    def get(self, request):
        serializer = AdminProfileSerializer(request.user, context={"request": request})
        return success_response("Admin profile retrieved successfully.", serializer.data)

    def patch(self, request):
        serializer = AdminProfileUpdateSerializer(
            request.user,
            data=request.data,
            partial=True,
            context={"request": request},
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()
        profile_serializer = AdminProfileSerializer(
            request.user,
            context={"request": request},
        )
        return success_response("Admin profile updated successfully.", profile_serializer.data)


class AdminUserViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = [IsAuthenticated, IsAdminUser]
    serializer_class = AdminUserSerializer
    queryset = User.objects.all().order_by("-created_at")
    search_fields = ("email", "full_name")
    ordering_fields = ("created_at", "updated_at", "email", "full_name")
