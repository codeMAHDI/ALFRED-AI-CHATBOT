import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class AuthController extends GetxController {
  // Sign In / Sign Up fields
  final nameController = ''.obs;
  final emailController = ''.obs;
  final passwordController = ''.obs;
  final confirmPasswordController = ''.obs;
  
  // OTP fields
  final otpController = ''.obs;
  var otpEmail = ''.obs;
  var isForgotPasswordFlow = false.obs;

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      otpEmail.value = Get.arguments.toString();
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void signIn() {
    print("Sign In tapped with email: ${emailController.value}");
    Get.offAllNamed(AppRoutes.profileSetupScreen);
  }

  void createAccount() {
    isForgotPasswordFlow.value = false;
    Get.toNamed(AppRoutes.verifyOtpScreen, arguments: emailController.value);
  }

  void forgotPassword() {
    isForgotPasswordFlow.value = true;
    Get.toNamed(AppRoutes.verifyOtpScreen, arguments: emailController.value);
  }

  void signInWithGoogle() {
    print("Google Sign In tapped");
  }

  void signInWithApple() {
    print("Apple Sign In tapped");
  }

  void verifyOtp() {
    print("Verifying OTP: ${otpController.value}");
    if (isForgotPasswordFlow.value) {
      Get.toNamed(AppRoutes.setNewPasswordScreen);
    } else {
      Get.offAllNamed(AppRoutes.authScreen);
    }
  }

  void resendOtp() {
    print("Resending OTP to ${otpEmail.value}");
  }
}
