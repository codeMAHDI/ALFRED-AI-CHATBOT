import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class SignUpViewModel extends GetxController {
  final nameController = ''.obs;
  final emailController = ''.obs;
  final passwordController = ''.obs;
  final confirmPasswordController = ''.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void createAccount() {
    // TODO: Implement actual sign up logic
    // Navigate to OTP screen after successful account creation
    Get.toNamed(AppRoutes.otpScreen, arguments: emailController.value);
  }
}
