import 'package:get/get.dart';
import '../view_models/alfred_chat_controller.dart';

class AlfredChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlfredChatController>(() => AlfredChatController());
  }
}
