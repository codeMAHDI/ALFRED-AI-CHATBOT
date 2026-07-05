import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Notification Settings
  final pushNotifications = true.obs;
  final dateReminders = true.obs;

  void togglePushNotifications(bool value) => pushNotifications.value = value;
  void toggleDateReminders(bool value) => dateReminders.value = value;

  // Security Settings
  final isCurrentPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  void toggleCurrentPassword() => isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  void toggleNewPassword() => isNewPasswordVisible.value = !isNewPasswordVisible.value;
  void toggleConfirmPassword() => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
}
