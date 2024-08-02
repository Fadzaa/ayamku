import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:get/get.dart';


class DetailOrderPageController extends GetxController {
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

}
