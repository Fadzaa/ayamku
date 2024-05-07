import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_controller.dart';
import 'package:get/get.dart';

class PaymentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentPageController>(() => PaymentPageController());
  }
}