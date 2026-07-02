import 'package:get/get.dart';

class MainLayoutViewModel extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
