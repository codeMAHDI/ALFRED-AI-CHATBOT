import 'package:get/get.dart';
import '../view_models/date_history_view_model.dart';

class DateHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateHistoryViewModel>(() => DateHistoryViewModel());
  }
}
