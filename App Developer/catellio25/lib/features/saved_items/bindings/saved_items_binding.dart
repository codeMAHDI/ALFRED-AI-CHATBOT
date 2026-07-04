import 'package:get/get.dart';
import '../view_models/saved_items_view_model.dart';

class SavedItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedItemsViewModel>(() => SavedItemsViewModel());
  }
}
