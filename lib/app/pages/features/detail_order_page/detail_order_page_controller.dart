import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DetailOrderPageController extends GetxController {
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }
}
