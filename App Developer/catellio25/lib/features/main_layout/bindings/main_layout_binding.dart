import 'package:get/get.dart';
import '../view_models/main_layout_view_model.dart';
import '../../home/view_models/home_view_model.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutViewModel>(() => MainLayoutViewModel());
    // Also inject HomeViewModel here since it will be loaded within MainLayout
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
  }
}
