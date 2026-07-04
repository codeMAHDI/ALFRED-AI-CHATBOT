import 'package:get/get.dart';

class SecuritySettingsViewModel extends GetxController {
  final isCurrentPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  void toggleCurrentPassword() => isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  void toggleNewPassword() => isNewPasswordVisible.value = !isNewPasswordVisible.value;
  void toggleConfirmPassword() => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
}
