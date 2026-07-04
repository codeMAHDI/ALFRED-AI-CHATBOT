import 'package:get/get.dart';
import '../view_models/security_settings_controller.dart';

class SecuritySettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecuritySettingsController>(() => SecuritySettingsController());
  }
}
