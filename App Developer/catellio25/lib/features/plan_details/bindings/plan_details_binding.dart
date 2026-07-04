import 'package:get/get.dart';
import '../view_models/plan_details_controller.dart';

class PlanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanDetailsController>(() => PlanDetailsController());
  }
}
