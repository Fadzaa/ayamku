import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:get/get.dart';


class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}