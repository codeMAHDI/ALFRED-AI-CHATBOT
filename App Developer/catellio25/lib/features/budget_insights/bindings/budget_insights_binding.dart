import 'package:get/get.dart';
import '../view_models/budget_insights_controller.dart';

class BudgetInsightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetInsightsController>(() => BudgetInsightsController());
  }
}
