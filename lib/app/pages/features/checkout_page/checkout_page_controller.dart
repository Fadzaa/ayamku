import 'dart:convert';

import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart' as cartResponse;
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/pos/model/PostResponse.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_alert_dialog.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckoutPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxDouble totalPrice = 0.0.obs;
  Rx<Pos?> selectedPos = Rx<Pos?>(null);
  RxBool isTypeOrderSelect = true.obs;
  RxString selectedMethod = 'on_delivery'.obs;
  var selectedTime = Rx<TimeOfDay?>(null);
  RxInt hour = 7.obs;
  RxInt minute = 0.obs;

  void setHour(int value) {
    hour.value = value;
    update();
  }

  void setMinute(int value) {
    minute.value = value;
    update();
  }

  void selectOnDelivery() {
    isTypeOrderSelect.value = true;
    selectedMethod.value = 'on_delivery';

  }

  void selectPickUp() {
    isTypeOrderSelect.value = false;
    selectedMethod.value = 'pickup';
  }

  void selectTime(int hour, int minute) {
  selectedTime.value = TimeOfDay(hour: hour, minute: minute);
  }

  //fetch cart
  List<cartResponse.CartItems> carts = <cartResponse.CartItems>[];
  CartService cartService = CartService();
  CartsResponse cartsResponse = CartsResponse();

  //fetch order
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  @override
  void onInit() {
    super.onInit();

    cartService = CartService();
    getCart();
    loadSelectedPos();
  }

  Future<String?> getVoucherCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voucherCode = prefs.getString('voucherCode');
    return voucherCode;
  }

  void setTime(TimeOfDay time) {
    if (time.hour >= 7 && time.hour < 15) {
      selectedTime.value = time;
    }
  }

  void loadSelectedPos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? posJson = prefs.getString('selectedPos');
    if (posJson != null) {
      selectedPos.value = Pos.fromJson(jsonDecode(posJson));
    }
  }

  Future getCart() async {
    try {
      isLoading(true);
      final response = await cartService.getCart();
      print("Server response:");
      print(response.data);

      cartsResponse = CartsResponse.fromJson(response.data);
      carts = cartsResponse.data!.cartItems!;
      totalPrice.value = cartsResponse.data!.totalPrice!.toDouble();
      print("Parsed carts:");
      print(carts);

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future storeOrder() async {
    try {
      isLoading(true);

      print("Sending order data:");
      print("Cart ID: ${cartsResponse.data?.id}");
      print("Method Type: ${selectedMethod.value}");
      print("Posts ID: ${selectedPos.value?.id.toString()}");
      print("Status: processing");

      dio.FormData formData = dio.FormData.fromMap({
        'cart_id':  cartsResponse.data?.id.toString(),
        'method_type': selectedMethod.value.toString(),
        'posts_id': selectedPos.value?.id.toString(),
        'status': 'processing',
      });

      final response = await orderService.storeOrder(formData);
      print("Server response:");
      print(response.data);


      Get.snackbar("Success", "Order berhasil dibuat");


      String? voucherCode = await getVoucherCode();
      // Get.toNamed(Routes.ORDER_PAGE, arguments: {'voucherCode': voucherCode});
      Get.offAllNamed(Routes.HOME_PAGE, arguments: 1);

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }


  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }


}