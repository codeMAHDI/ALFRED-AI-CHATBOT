import 'package:get/get.dart';
import '../view_models/sign_up_view_model.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpViewModel>(() => SignUpViewModel());
  }
}
