import 'package:get/get.dart';
import 'input_voucher_controller.dart';


class InputVoucherPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<inputVoucherController>(() => inputVoucherController());
  }
}