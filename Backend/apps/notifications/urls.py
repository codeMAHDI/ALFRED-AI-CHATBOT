"""
notifications/urls.py

REST URL registration for notification viewsets.

WebSocket is registered separately in core/asgi.py via notifications/routing.py:
    ws://host/ws/notifications/?token=<access_token>

REST endpoints registered here:
    /api/notification/user/              → SharedNotificationViewSet (Users)
    /api/notification/user/<id>/         → retrieve
    /api/notification/user/<id>/mark-read/
    /api/notification/user/mark-all-read/
    /api/notification/user/unread-count/
    /api/notification/user/clear-read/

    /api/notification/admin/               → AdminNotificationViewSet (for admin)
    /api/notification/admin/<id>/          → retrieve
    /api/notification/admin/<id>/mark-read/
    /api/notification/admin/mark-all-read/
    /api/notification/admin/unread-count/
    /api/notification/admin/clear-read/
"""

from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import *

router = DefaultRouter()
router.register(r"user", UserNotificationViewSet, basename="notification-shared")
router.register(r"admin",  AdminNotificationViewSet,  basename="notification-admin")

urlpatterns = [
    path("", include(router.urls)),
]