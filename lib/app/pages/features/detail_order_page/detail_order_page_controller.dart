import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailOrderPageController extends GetxController{


  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  var orderStatus = ''.obs;

  void updateOrderStatus(String status) {
    orderStatus.value = status;
  }

  var cartItems = [].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      cartItems.value = Get.arguments;
    }
  }




}