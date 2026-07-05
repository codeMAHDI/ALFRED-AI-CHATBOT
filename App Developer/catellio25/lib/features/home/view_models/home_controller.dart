import 'package:get/get.dart';

class HomeController extends GetxController {
  final searchQuery = ''.obs;
  final isListening = false.obs;

  void toggleListening() {
    isListening.value = !isListening.value;
  }
}
