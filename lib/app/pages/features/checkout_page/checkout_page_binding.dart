import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:get/get.dart';

class CheckoutPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CheckoutPageController>(() => CheckoutPageController());
  }
}