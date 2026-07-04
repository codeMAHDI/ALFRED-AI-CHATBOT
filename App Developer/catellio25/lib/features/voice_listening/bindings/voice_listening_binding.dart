import 'package:get/get.dart';
import '../view_models/voice_listening_controller.dart';

class VoiceListeningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceListeningController>(() => VoiceListeningController());
  }
}
