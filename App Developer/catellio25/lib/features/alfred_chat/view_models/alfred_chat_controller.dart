import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class AlfredChatController extends GetxController {
  var messages = <ChatMessage>[
    ChatMessage(text: "Who are we planning for today?", isUser: false),
    ChatMessage(text: "i want to have a date plan with lisa", isUser: true),
    ChatMessage(text: "Tell me about Lisa.", isUser: false),
    ChatMessage(text: "She likes hiking and coffee.", isUser: true),
    ChatMessage(text: "What budget would you like to stay within?", isUser: false),
    ChatMessage(text: "Around \$150.", isUser: true),
    ChatMessage(text: "Checking your calendar and finding the perfect plan...", isUser: false),
  ].obs;

  final TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(ChatMessage(text: textController.text.trim(), isUser: true));
      textController.clear();
      
      // Simulate bot reply
      Future.delayed(const Duration(seconds: 1), () {
        messages.add(ChatMessage(text: "I'll look into that for you.", isUser: false));
      });
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
