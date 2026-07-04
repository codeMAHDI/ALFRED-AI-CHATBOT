import 'package:get/get.dart';
import '../view_models/main_layout_controller.dart';
import '../../home/view_models/home_controller.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    // Also inject HomeController here since it will be loaded within MainLayout
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
