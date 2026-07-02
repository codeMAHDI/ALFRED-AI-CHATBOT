import 'package:get/get.dart';

class MainLayoutViewModel extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['tab'] != null) {
      selectedIndex.value = Get.arguments['tab'];
    }
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
