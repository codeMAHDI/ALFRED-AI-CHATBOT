import 'package:get/get.dart';
import '../view_models/finding_date_splash_controller.dart';

class FindingDateSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FindingDateSplashController>(FindingDateSplashController());
  }
}
