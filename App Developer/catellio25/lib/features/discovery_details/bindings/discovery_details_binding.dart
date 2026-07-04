import 'package:get/get.dart';
import '../view_models/discovery_details_controller.dart';

class DiscoveryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoveryDetailsController>(() => DiscoveryDetailsController());
  }
}
