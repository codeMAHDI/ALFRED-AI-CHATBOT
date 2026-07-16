"""
notifications/services.py

Delivery strategy:
    User  → DB record only. Mobile app polls REST endpoints.
    Admin → DB record + real-time WebSocket push.

Usage:
    Never call NotificationService directly from views or other apps.
    Always go through NotificationTemplates — one method per domain event.

Example:
    from notifications.services import NotificationTemplates
    NotificationTemplates.connection_request_received(receiver=user, sender=other_user)
"""

import logging

from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
from django.contrib.auth import get_user_model
from django.utils import timezone

from .models import *

logger = logging.getLogger(__name__)
User = get_user_model()


# ─────────────────────────────────────────────────────────────────────────────
# Admin role check helper
# ─────────────────────────────────────────────────────────────────────────────

def _is_admin(user) -> bool:
    """Returns True for Admin roles."""
    return getattr(user, "is_staff", False) and getattr(user, "is_superuser", False)  # TODO: Logic recheck


# ─────────────────────────────────────────────────────────────────────────────
# Low-level engine — internal use only
# ─────────────────────────────────────────────────────────────────────────────

class NotificationService:
    """
    Core dispatcher — not called directly from outside this module.
    Route all notification triggers through NotificationTemplates instead.

    Routing logic (automatic, resolved via user.role):
        User  → DB write only
        Admin → DB write + WebSocket push
    """

    @staticmethod
    def send(
        user,
        notification_type: str,
        title: str,
        body: str,
        data: dict = None,
        priority: str = NotificationPriority.NORMAL,
    ) -> "Notification | None":
        """
        Persist a Notification and dispatch it appropriately.

        Returns:
            The created Notification instance, or None if notifications are
            disabled for this user.
        """
        # Respect per-user notification preference (if the setting exists)
        if hasattr(user, "settings") and not user.settings.notification_enabled:
            logger.info("Notifications disabled for %s — skipped.", user.email)
            return None

        notification = Notification.objects.create(
            user=user,
            notification_type=notification_type,
            title=title,
            body=body,
            data=data or {},
            priority=priority,
        )

        if _is_admin(user):
            # Admin gets an additional real-time WebSocket push
            ws_ok = NotificationService._push_websocket(
                user_id=str(user.id),
                notification_id=str(notification.id),
                notification_type=notification_type,
                title=title,
                body=body,
                data=data or {},
                priority=priority,
            )
            notification.websocket_pushed  = True
            notification.websocket_success = ws_ok
            notification.save(update_fields=["websocket_pushed", "websocket_success"])
            logger.info(
                "Admin notification → %s | type=%s | ws_ok=%s",
                user.email, notification_type, ws_ok,
            )
        else:
            logger.info(
                "Notification saved → %s | type=%s | role=%s (REST polling)",
                user.email, notification_type, getattr(user, "role", "unknown"),
            )

        return notification

    # ── WebSocket push — admin dashboard only ─────────────────────────────────

    @staticmethod
    def _push_websocket(
        user_id: str,
        notification_id: str,
        notification_type: str,
        title: str,
        body: str,
        data: dict,
        priority: str,
    ) -> bool:
        """Push to the admin's open WebSocket channel. Returns True on success."""
        try:
            channel_layer = get_channel_layer()
            async_to_sync(channel_layer.group_send)(
                f"user_{user_id}",
                {
                    "type":              "notification_message",  # maps to consumer method
                    "notification_id":   notification_id,
                    "notification_type": notification_type,
                    "title":             title,
                    "body":              body,
                    "data":              data,
                    "priority":          priority,
                    "timestamp":         timezone.now().isoformat(),
                },
            )
            return True
        except Exception as exc:
            logger.error("WebSocket push failed for user %s: %s", user_id, exc)
            return False

    # ── Broadcast helpers ─────────────────────────────────────────────────────

    @staticmethod
    def send_to_all_admins(
        notification_type: str,
        title: str,
        body: str,
        data: dict = None,
    ) -> None:
        """Send a notification to every active admin."""
        admins = User.objects.filter(
            is_staff=True,
            is_superuser=True,
            is_active=True,
        )
        for admin in admins:
            NotificationService.send(
                user=admin,
                notification_type=notification_type,
                title=title,
                body=body,
                data=data,
            )


# ─────────────────────────────────────────────────────────────────────────────
# High-level domain templates — the ONLY public interface for other apps
# ─────────────────────────────────────────────────────────────────────────────

class NotificationTemplates:
    """
    One static method per AMM domain event.

    Import and call these from views, signals, or Celery tasks — never
    call NotificationService directly from outside this file.

    Example:
        from notifications.services import NotificationTemplates
        NotificationTemplates.welcome(user)
    """

    # ── Auth / Account ────────────────────────────────────────────────────────

    @staticmethod
    def welcome(user) -> "Notification | None":
        """Sent immediately after successful email verification."""
        return NotificationService.send(
            user=user,
            notification_type=NotificationType.WELCOME,
            title="Welcome to A Muslim Matchmaker 🌙",
            body=f"As-salamu alaykum {user.first_name} {user.last_name} or {user.email}! Your account is ready. Complete your profile to get started.",
            priority=NotificationPriority.NORMAL,
        )

    @staticmethod
    def password_changed(user) -> "Notification | None":
        """Sent after a successful password change or reset."""
        return NotificationService.send(
            user=user,
            notification_type=NotificationType.PASSWORD_CHANGED,
            title="Password Changed",
            body="Your AMM password was changed successfully. If this wasn't you, contact support immediately.",
            priority=NotificationPriority.HIGH,
        )

    
    
    # ── Admin-only alerts ─────────────────────────────────────────────────────

    @staticmethod
    def new_user_joined(new_user) -> None:
        """Broadcast to all admins when a new user completes registration."""
        role_display = getattr(new_user, "role", "user").capitalize()
        NotificationService.send_to_all_admins(
            notification_type=NotificationType.NEW_USER_JOINED,
            title=f"New {role_display} Registered",
            body=f"{new_user.first_name} {new_user.last_name} or {new_user.email} ({new_user.codename}) just joined AMM.",
            data={"user_id": str(new_user.id), "codename": new_user.codename, "role": new_user.role},
        )