import 'package:get/get.dart';
import '../view_models/notification_settings_view_model.dart';

class NotificationSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationSettingsViewModel>(() => NotificationSettingsViewModel());
  }
}
