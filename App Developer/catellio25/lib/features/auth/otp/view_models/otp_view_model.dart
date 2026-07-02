import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';

class OtpViewModel extends GetxController {
  final otpController = ''.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get email passed from sign up screen
    if (Get.arguments != null) {
      email.value = Get.arguments.toString();
    }
  }

  void verifyOtp() {
    // TODO: Implement OTP verification logic
    print("Verifying OTP: ${otpController.value}");
    Get.offAllNamed(AppRoutes.signInScreen);
  }

  void resendOtp() {
    // TODO: Implement resend OTP logic
    print("Resending OTP to ${email.value}");
  }
}
