import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:get/get.dart';

class DetailPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailPageController>(() => DetailPageController());
  }
}