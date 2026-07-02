import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_const/app_const.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.splashScreen);
    });
  }
  }

