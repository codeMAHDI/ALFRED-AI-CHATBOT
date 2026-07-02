import 'package:get/get.dart';
import '../../../core/constants/app_constants.dart';
// import '../../../core/app_routes/app_routes.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Simulate a loading delay
    await Future.delayed(AppConstants.splashDuration);
    
    // TODO: Navigate to the next screen (e.g., Auth or Home)
    // Get.offAllNamed(AppRoutes.home);
    print("Navigating to next screen after splash...");
  }
}
