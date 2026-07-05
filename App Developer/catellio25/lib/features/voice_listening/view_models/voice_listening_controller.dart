import 'package:get/get.dart';

enum VoiceBotState { listening, thinking, speaking }

class VoiceListeningController extends GetxController {
  final Rx<VoiceBotState> currentState = VoiceBotState.listening.obs;

  @override
  void onInit() {
    super.onInit();
    _simulateBotInteraction();
  }

  void _simulateBotInteraction() async {
    // 1. Start with listening (already set)
    await Future.delayed(const Duration(seconds: 3));
    
    // 2. Change to thinking
    currentState.value = VoiceBotState.thinking;
    await Future.delayed(const Duration(seconds: 2));
    
    // 3. Change to speaking
    currentState.value = VoiceBotState.speaking;
  }
}
