import 'package:get/get.dart';

enum VoiceBotState { listening, thinking, speaking }

class VoiceListeningController extends GetxController {
  final Rx<VoiceBotState> currentState = VoiceBotState.listening.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onMicTapped() async {
    if (currentState.value == VoiceBotState.listening) {
      // User finished speaking, now thinking
      currentState.value = VoiceBotState.thinking;
      
      // Simulate API delay, then start speaking
      await Future.delayed(const Duration(seconds: 2));
      if (currentState.value == VoiceBotState.thinking) {
        currentState.value = VoiceBotState.speaking;
      }
    } else {
      // If thinking or speaking, tapping mic interrupts and starts listening again
      currentState.value = VoiceBotState.listening;
    }
  }
}
