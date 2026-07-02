import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../main_layout/view_models/main_layout_view_model.dart';

class FindingDateSplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToPlans();
  }

  void _navigateToPlans() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.mainLayoutScreen, arguments: {'tab': 1});
    });
  }
}
