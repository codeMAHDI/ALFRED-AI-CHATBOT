import 'package:get/get.dart';
import '../view_models/notifications_view_model.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsViewModel>(() => NotificationsViewModel());
  }
}
