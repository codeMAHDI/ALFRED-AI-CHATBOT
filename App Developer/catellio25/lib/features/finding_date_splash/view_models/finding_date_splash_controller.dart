import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';

class FindingDateSplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToPlans();
  }

  void _navigateToPlans() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.homeScreen, arguments: {'tab': 1});
    });
  }
}
