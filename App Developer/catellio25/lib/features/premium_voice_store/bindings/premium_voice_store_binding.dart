import 'package:get/get.dart';
import '../view_models/premium_voice_store_view_model.dart';

class PremiumVoiceStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PremiumVoiceStoreViewModel>(() => PremiumVoiceStoreViewModel());
  }
}
