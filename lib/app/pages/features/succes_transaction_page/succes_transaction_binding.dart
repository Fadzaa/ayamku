import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/succes_transaction_controller.dart';
import 'package:get/get.dart';

class SuccesTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccesTransactionController>(() => SuccesTransactionController());
  }
}