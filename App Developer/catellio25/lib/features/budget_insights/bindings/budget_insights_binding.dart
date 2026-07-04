import 'package:get/get.dart';
import '../view_models/budget_insights_view_model.dart';

class BudgetInsightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetInsightsViewModel>(() => BudgetInsightsViewModel());
  }
}
