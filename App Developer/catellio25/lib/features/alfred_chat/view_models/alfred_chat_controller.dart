import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
  final ImagePicker _picker = ImagePicker();

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

  Future<void> pickMedia() async {
    try {
      final XFile? media = await _picker.pickMedia();
      if (media != null) {
        // Send a dummy message indicating a file was uploaded
        messages.add(ChatMessage(text: "📎 Sent a file: ${media.name}", isUser: true));
        
        // Simulate bot reply
        Future.delayed(const Duration(seconds: 1), () {
          messages.add(ChatMessage(text: "I've received your file. What would you like me to do with it?", isUser: false));
        });
      }
    } catch (e) {
      debugPrint("Error picking media: $e");
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
