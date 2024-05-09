import 'package:get/get.dart';

class PaymentPageController extends GetxController{

  final RxString valuePay = "Gopay".obs;
  RxString get orderTypeString => valuePay;

  void setOrderType(String pay) {
    valuePay.value = pay;
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}