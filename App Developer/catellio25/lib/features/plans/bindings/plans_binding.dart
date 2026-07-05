import 'package:get/get.dart';
import '../view_models/plans_controller.dart';

class PlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlansController>(() => PlansController());
  }
}
