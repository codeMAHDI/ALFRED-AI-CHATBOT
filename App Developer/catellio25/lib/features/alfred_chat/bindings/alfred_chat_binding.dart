import 'package:get/get.dart';
import '../view_models/alfred_chat_view_model.dart';

class AlfredChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlfredChatViewModel>(() => AlfredChatViewModel());
  }
}
