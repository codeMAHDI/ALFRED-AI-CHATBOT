import 'package:get/get.dart';
import '../view_models/premium_voice_store_controller.dart';

class PremiumVoiceStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PremiumVoiceStoreController>(() => PremiumVoiceStoreController());
  }
}
