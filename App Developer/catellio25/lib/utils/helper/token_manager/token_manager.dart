import 'package:flutter/foundation.dart';
import '../../../data/local/shared_prefe.dart';
import '../../app_const/app_const.dart';

class TokenManager {
static const String _keyEmail = "currentUserEmail";

static Future<void> saveTokens({
required String accessToken,
required String refreshToken,
required String email,
required String role,
}) async {
await SharePrefsHelper.setString(AppConstants.bearerToken, accessToken);
await SharePrefsHelper.setString(AppConstants.refreshToken, refreshToken);
await SharePrefsHelper.setString(_keyEmail, email);
await SharePrefsHelper.setString(AppConstants.role, role);
debugPrint("Tokens and user data saved successfully.");
}

/// Check if the user has an active access token
static Future<bool> hasToken() async {
final token = await getAccessToken();
return token.isNotEmpty;
}

/// Get Access Token
static Future<String> getAccessToken() async {
return await SharePrefsHelper.getString(AppConstants.bearerToken);
}

/// Get Refresh Token
static Future<String> getRefreshToken() async {
return await SharePrefsHelper.getString(AppConstants.refreshToken);
}

/// Get Current User Email
static Future<String> getEmail() async {
return await SharePrefsHelper.getString(_keyEmail);
}

/// Get Current User Role
static Future<String> getRole() async {
return await SharePrefsHelper.getString(AppConstants.role);
}

/// Clear all login-related data
static Future<void> clearTokens() async {
await SharePrefsHelper.remove(AppConstants.bearerToken);
await SharePrefsHelper.remove(AppConstants.refreshToken);
await SharePrefsHelper.remove(AppConstants.role);
debugPrint("Tokens cleared.");
}
}