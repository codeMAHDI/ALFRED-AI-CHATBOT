import 'package:get/get.dart';
import '../view_models/terms_conditions_view_model.dart';

class TermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsConditionsViewModel>(() => TermsConditionsViewModel());
  }
}
