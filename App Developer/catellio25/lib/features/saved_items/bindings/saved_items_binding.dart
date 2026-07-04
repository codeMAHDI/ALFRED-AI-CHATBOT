import 'package:get/get.dart';
import '../view_models/saved_items_controller.dart';

class SavedItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedItemsController>(() => SavedItemsController());
  }
}
