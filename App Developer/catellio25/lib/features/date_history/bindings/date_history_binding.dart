import 'package:get/get.dart';
import '../view_models/date_history_controller.dart';

class DateHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateHistoryController>(() => DateHistoryController());
  }
}
