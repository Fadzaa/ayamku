import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_controller.dart';
import 'package:get/get.dart';


class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilePageController>(() => EditProfilePageController());
  }
}