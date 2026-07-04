import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  final pushNotifications = true.obs;
  final dateReminders = true.obs;

  void togglePushNotifications(bool value) => pushNotifications.value = value;
  void toggleDateReminders(bool value) => dateReminders.value = value;
}
