import 'package:get/get.dart';
import '../view_models/discovery_controller.dart';

class DiscoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoveryController>(() => DiscoveryController());
  }
}
