import 'package:get/get.dart';
import '../view_models/otp_view_model.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpViewModel>(() => OtpViewModel());
  }
}
