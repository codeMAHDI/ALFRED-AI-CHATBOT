import 'package:get/get.dart';
import '../view_models/security_settings_view_model.dart';

class SecuritySettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecuritySettingsViewModel>(() => SecuritySettingsViewModel());
  }
}
