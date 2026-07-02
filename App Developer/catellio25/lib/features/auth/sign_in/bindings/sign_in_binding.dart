import 'package:get/get.dart';
import '../view_models/sign_in_view_model.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInViewModel>(() => SignInViewModel());
  }
}
