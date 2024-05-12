import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:get/get.dart';


class GeprekPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<favouritePageController>(() => favouritePageController());
  }
}