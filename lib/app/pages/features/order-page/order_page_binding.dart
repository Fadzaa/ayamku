import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:get/get.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OrderPageController>(() => OrderPageController());
  }

}