from django.core.cache import cache
from django.test import override_settings
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from .models import User


@override_settings(
    CACHES={
        "default": {
            "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
        }
    },
    EMAIL_BACKEND="django.core.mail.backends.locmem.EmailBackend",
    CELERY_TASK_ALWAYS_EAGER=True,
)
class UserAuthFlowTests(APITestCase):
    def setUp(self):
        cache.clear()
        self.user = User.objects.create_user(
            email="user@example.com",
            password="StrongPass123!",
            full_name="Regular User",
        )
        self.admin = User.objects.create_user(
            email="admin@example.com",
            password="StrongPass123!",
            full_name="Admin User",
            is_staff=True,
            is_superuser=True,
        )

    def test_user_login_returns_tokens(self):
        response = self.client.post(
            reverse("user-login"),
            {"email": self.user.email, "password": "StrongPass123!"},
            format="json",
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue(response.data["success"])
        self.assertIn("access_token", response.data["data"])
        self.assertIn("refresh_token", response.data["data"])

    def test_admin_login_rejects_non_admin(self):
        response = self.client.post(
            reverse("admin-login"),
            {"email": self.user.email, "password": "StrongPass123!"},
            format="json",
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertIn("Admin access required.", str(response.data))

    def test_change_password_updates_credentials(self):
        login = self.client.post(
            reverse("user-login"),
            {"email": self.user.email, "password": "StrongPass123!"},
            format="json",
        )
        access_token = login.data["data"]["access_token"]
        self.client.credentials(HTTP_AUTHORIZATION=f"Bearer {access_token}")

        response = self.client.post(
            reverse("password-change"),
            {
                "old_password": "StrongPass123!",
                "new_password": "EvenStrongerPass456!",
                "confirm_new_password": "EvenStrongerPass456!",
            },
            format="json",
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.user.refresh_from_db()
        self.assertTrue(self.user.check_password("EvenStrongerPass456!"))

    def test_password_reset_flow_resets_password(self):
        initiate = self.client.post(
            reverse("password-reset-initiate"),
            {"email": self.user.email},
            format="json",
        )
        self.assertEqual(initiate.status_code, status.HTTP_200_OK)

        otp = cache.get(f"password_reset_otp:{self.user.email}")
        verify = self.client.post(
            reverse("password-reset-verify"),
            {"email": self.user.email, "otp": otp},
            format="json",
        )
        self.assertEqual(verify.status_code, status.HTTP_200_OK)

        reset_token = verify.data["data"]["reset_token"]
        confirm = self.client.post(
            reverse("password-reset-confirm"),
            {
                "reset_token": reset_token,
                "new_password": "BrandNewPass789!",
                "confirm_new_password": "BrandNewPass789!",
            },
            format="json",
        )
        self.assertEqual(confirm.status_code, status.HTTP_200_OK)

        self.user.refresh_from_db()
        self.assertTrue(self.user.check_password("BrandNewPass789!"))

    def test_registration_flow_creates_user_after_otp_verification(self):
        initiate = self.client.post(
            reverse("user-register-initiate"),
            {
                "full_name": "New User",
                "email": "new@example.com",
                "password": "StrongPass123!",
                "confirm_password": "StrongPass123!",
            },
            format="json",
        )
        self.assertEqual(initiate.status_code, status.HTTP_200_OK)

        otp_payload = cache.get("registration_otp:new@example.com")
        verify = self.client.post(
            reverse("user-register-verify"),
            {"email": "new@example.com", "otp": otp_payload["otp"]},
            format="json",
        )
        self.assertEqual(verify.status_code, status.HTTP_201_CREATED)
        self.assertTrue(User.objects.filter(email="new@example.com").exists())
