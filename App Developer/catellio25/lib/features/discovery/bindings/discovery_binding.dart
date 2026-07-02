import 'package:get/get.dart';
import '../view_models/discovery_view_model.dart';

class DiscoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoveryViewModel>(() => DiscoveryViewModel());
  }
}
