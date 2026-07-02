import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboardingScreen);
  }
}
