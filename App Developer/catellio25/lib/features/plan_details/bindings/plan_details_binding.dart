import 'package:get/get.dart';
import '../view_models/plan_details_view_model.dart';

class PlanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanDetailsViewModel>(() => PlanDetailsViewModel());
  }
}
