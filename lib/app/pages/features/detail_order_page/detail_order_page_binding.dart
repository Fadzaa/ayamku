import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:get/get.dart';

class DetailOrderPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailOrderPageController());
  }

}