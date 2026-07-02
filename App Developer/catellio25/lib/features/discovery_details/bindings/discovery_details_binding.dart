import 'package:get/get.dart';
import '../view_models/discovery_details_view_model.dart';

class DiscoveryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoveryDetailsViewModel>(() => DiscoveryDetailsViewModel());
  }
}
