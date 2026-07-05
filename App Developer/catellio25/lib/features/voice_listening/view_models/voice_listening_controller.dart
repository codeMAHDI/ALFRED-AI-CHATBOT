import 'package:get/get.dart';

enum VoiceBotState { idle, listening, thinking, speaking }

class VoiceListeningController extends GetxController {
  final Rx<VoiceBotState> currentState = VoiceBotState.idle.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void startListening() {
    // When user holds down the mic
    currentState.value = VoiceBotState.listening;
  }

  void stopListening() async {
    // When user releases the mic
    if (currentState.value == VoiceBotState.listening) {
      currentState.value = VoiceBotState.thinking;
      
      // Simulate API delay, then start speaking
      await Future.delayed(const Duration(seconds: 2));
      if (currentState.value == VoiceBotState.thinking) {
        currentState.value = VoiceBotState.speaking;
      }
    }
  }
}
