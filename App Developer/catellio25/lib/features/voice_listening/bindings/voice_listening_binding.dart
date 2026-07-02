import 'package:get/get.dart';
import '../view_models/voice_listening_view_model.dart';

class VoiceListeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceListeningViewModel>(() => VoiceListeningViewModel());
  }
}
