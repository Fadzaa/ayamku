import 'dart:convert';

import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart' as cartResponse;
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/pos/model/PostResponse.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_alert_dialog.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';


class CheckoutPageController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Pos?> selectedPos = Rx<Pos?>(null);
  RxBool isOnDeliverySelected = true.obs;
  RxString selectedMethod = 'On Delivery'.obs;
  var selectedTime = Rx<TimeOfDay?>(null);

  void selectOnDelivery() {
    isOnDeliverySelected.value = true;
    selectedMethod.value = 'on_delivery';

  }

  void selectPickUp() {
    isOnDeliverySelected.value = false;
    selectedMethod.value = 'pickup';
  }

  // void selectPickupTime(BuildContext context) async {
  //   TimeOfDay currentTime = TimeOfDay.now();
  //   TimeOfDay maximumTime = TimeOfDay(hour: 20, minute: 0);
  //
  //   TimeOfDay? pickedTime = await showTimePicker(
  //     context: context,
  //     initialTime: currentTime,
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: Colors.black,
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (pickedTime != null) {
  //     if (pickedTime.hour > maximumTime.hour ||
  //         (pickedTime.hour == maximumTime.hour && pickedTime.minute > maximumTime.minute)) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return ItemAlertDialog(
  //               title: "Sesi pickup sudah habis",
  //               message: "Silahkan pesan besok lagi",
  //           );
  //         },
  //       );
  //     } else if (pickedTime.hour < currentTime.hour ||
  //         (pickedTime.hour == currentTime.hour && pickedTime.minute < currentTime.minute)) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return ItemAlertDialog(
  //               title: "Silahkan pilih waktu lain",
  //           );
  //         },
  //       );
  //     } else {
  //       selectedTime.value = pickedTime;
  //       update();
  //     }
  //
  //   }
  // }

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

      dio.FormData formData = dio.FormData.fromMap({
        'cart_id': cartsResponse.data!.id,
        'method_type': selectedMethod.value!,
        'posts_id': selectedPos.value!,
        'status': "processing",
      });

      final response = await orderService.storeOrder(formData);
      print("Server response:");
      print(response.data);

      Get.snackbar("Success", "Order berhasil dibuat");

      Get.toNamed(Routes.ORDER_PAGE);

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }
}