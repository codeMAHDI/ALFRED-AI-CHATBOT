import 'package:get/get.dart';
import '../view_models/edit_profile_view_model.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileViewModel>(() => EditProfileViewModel());
  }
}
