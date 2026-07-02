import 'package:get/get.dart';
import '../view_models/calendar_view_model.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarViewModel>(() => CalendarViewModel());
  }
}
