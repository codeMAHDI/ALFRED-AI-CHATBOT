import 'package:get/get.dart';
import '../view_models/privacy_policy_view_model.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyPolicyViewModel>(() => PrivacyPolicyViewModel());
  }
}
