import 'package:get/get.dart';
import '../view_models/finding_date_splash_view_model.dart';

class FindingDateSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FindingDateSplashViewModel>(FindingDateSplashViewModel());
  }
}
