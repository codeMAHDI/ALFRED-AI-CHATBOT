"""
users/permissions.py

Custom DRF permission classes for role-based access control.

Usage:
    from users.permissions import IsAdmin, ...

Permission classes available:
    List the permission classes defined in this file, along with a brief description of what each one does. For example:
"""

from rest_framework.permissions import BasePermission

from .models import *


class IsSubscribed(BasePermission):
    """
    Allow access only to users on Monthly or Annual subscription plans.
    Use this to gate: send requests, see suggestions, see profile viewers.
    """
    message = "This feature requires an active subscription (Monthly or Annual)."

    def has_permission(self, request, view):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.is_subscribed
        )


class IsSubscribedMonthly(BasePermission):
    """
    Allow access only to users on Monthly subscription plans.
    Use this to gate features exclusive to Monthly subscribers (if any).
    """
    message = "This feature requires an active Monthly subscription."

    def has_permission(self, request, view):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.is_subscribed_monthly
        )


class IsSubscribedAnnual(BasePermission):
    """
    Allow access only to users on Annual subscription plans.
    Use this to gate features exclusive to Annual subscribers (if any).
    """
    message = "This feature requires an active Annual subscription."

    def has_permission(self, request, view):
        return (
            request.user
            and request.user.is_authenticated
            and request.user.is_subscribed_annual
        )
