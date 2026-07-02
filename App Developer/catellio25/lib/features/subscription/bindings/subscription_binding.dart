import 'package:get/get.dart';
import '../view_models/subscription_view_model.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionViewModel>(() => SubscriptionViewModel());
  }
}
