import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class SignInViewModel extends GetxController {
  final emailController = ''.obs;
  final passwordController = ''.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void signIn() {
    // TODO: Implement sign in logic
    print("Sign In tapped with email: ${emailController.value}");
    Get.offAllNamed(AppRoutes.profileSetupScreen);
  }

  void signInWithGoogle() {
    // TODO: Implement Google sign in
    print("Google Sign In tapped");
  }

  void signInWithApple() {
    // TODO: Implement Apple sign in
    print("Apple Sign In tapped");
  }
}
