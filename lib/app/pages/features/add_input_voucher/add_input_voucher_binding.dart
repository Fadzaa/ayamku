import 'package:ayamku_delivery/app/pages/features/add_input_voucher/add_input_voucher_vode_controller.dart';
import 'package:get/get.dart';


class InputAddVoucherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<inputAddVoucherController>(() => inputAddVoucherController());
  }
}