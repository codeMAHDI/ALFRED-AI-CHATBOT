"""
users/urls.py

URL configuration for the users app.

Registered at: /api/user/ (from api/urls.py)

Full endpoint map:
    ── User registration ────────────────────────────────────────────
    POST /api/user/register/initiate/      UserInitiateRegistrationView
    POST /api/user/register/verify/        UserVerifyRegistrationView
    POST /api/user/login/                  UserLoginView

    ── Admin auth ────────────────────────────────────────────────────
    POST /api/user/admin/login/                 AdminLoginView          (Step 1: submit credentials, sends OTP)
    GET  /api/user/admin/profile/               AdminProfileView
    PATCH /api/user/admin/profile/              AdminProfileView

    ── Admin — user management ───────────────────────────────────────
    GET  /api/user/admin/users/                 AdminUserViewSet (list)
    GET  /api/user/admin/users/{id}/            AdminUserViewSet (retrieve)

    ── Shared auth (all roles) ───────────────────────────────────────
    POST /api/user/logout/                      LogoutView
    POST /api/user/password/change/             ChangePasswordView
    POST /api/user/password-reset/initiate/     InitiatePasswordResetView
    POST /api/user/password-reset/verify/       VerifyPasswordResetOTPView
    POST /api/user/password-reset/confirm/      ResetPasswordView
    POST /api/user/register/resend-otp/         ResendRegistrationOTPView

    ── OAuth ─────────────────────────────────────────────────────────
    POST /api/user/auth/google/                 GoogleOAuthView
    POST /api/user/auth/apple/                  AppleOAuthView

    ── User profile ──────────────────────────
    GET  /api/user/profile/                     UserProfileView
"""

from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import *

# ViewSet routers
router = DefaultRouter()
router.register(r"admin/users",        AdminUserViewSet,   basename="admin-users")

urlpatterns = [
    # ── User ──────────────────────────────────────────────────────────────────
    path("register/initiate/", UserInitiateRegistrationView.as_view(), name="user-register-initiate"),
    path("register/verify/",   UserVerifyRegistrationView.as_view(),   name="user-register-verify"),
    path("login/",             UserLoginView.as_view(),                name="user-login"),

    # ── Admin auth ────────────────────────────────────────────────────────────
    path("admin/login/",            AdminLoginView.as_view(),            name="admin-login"),
    path("admin/profile/",          AdminProfileView.as_view(),          name="admin-profile"),

    # ── Shared auth ───────────────────────────────────────────────────────────
    path("logout/",                  LogoutView.as_view(),                name="logout"),
    path("password/change/",         ChangePasswordView.as_view(),        name="password-change"),
    path("password-reset/initiate/", InitiatePasswordResetView.as_view(), name="password-reset-initiate"),
    path("password-reset/verify/",   VerifyPasswordResetOTPView.as_view(),name="password-reset-verify"),
    path("password-reset/confirm/",  ResetPasswordView.as_view(),         name="password-reset-confirm"),
    path("register/resend-otp/",     ResendRegistrationOTPView.as_view(), name="register-resend-otp"),

    # ── OAuth ─────────────────────────────────────────────────────────────────
    path("auth/google/", GoogleOAuthView.as_view(), name="google-oauth"),
    path("auth/apple/",  AppleOAuthView.as_view(),  name="apple-oauth"),

    # ── User profile ──────────────────────────────────────────────────────────
    path("profile/",          UserProfileView.as_view(),         name="user-profile"),

    # ── ViewSet routes (admin/users, admin/matchmakers) ───────────────────────
    path("", include(router.urls)),
]
