import 'dart:convert';
import 'dart:ffi';
import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart'
    as cartResponse;
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/pos/model/PostResponse.dart';
import 'package:ayamku_delivery/app/api/voucher/model/voucherResponse.dart';
import 'package:ayamku_delivery/app/api/voucher/voucher_service.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_view.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutPageController extends GetxController {
  final homePageController = Get.put(HomePageController());
  final homePageView = Get.put(HomePageView());

  RxBool isLoading = false.obs;
  RxInt totalPrice = RxInt(0);
  Rx<Pos?> selectedPos = Rx<Pos?>(null);
  RxBool isTypeOrderSelect = true.obs;
  RxString selectedMethod = 'on_delivery'.obs;
  var selectedTime = Rx<TimeOfDay?>(null);
  RxInt hour = 7.obs;
  RxInt minute = 0.obs;
  RxString voucherId = ''.obs;
  RxInt discount = 0.obs;

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

  // Fetch cart
  List<cartResponse.CartItems> carts = <cartResponse.CartItems>[];
  CartService cartService = CartService();
  CartsResponse cartsResponse = CartsResponse();

  // Fetch order
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  // Voucher
  VoucherResponse voucherResponse = VoucherResponse();

  @override
  void onInit() {
    super.onInit();

    cartService = CartService();
    getCart();
    loadSelectedPos();
    checkStoreStatus();
  }

  void checkStoreStatus() {
    if (homePageController.storeStatus == 0) {
      selectPickUp();
    }
  }

  Future<String?> getVoucherCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voucherCode = prefs.getString('unusedVoucherCode');
    return voucherCode;
  }

  Future<int?> getVoucherId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? voucherId = prefs.getInt('unusedVoucherId');
    return voucherId;
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
      carts = cartsResponse.cart!.cartItems!;
      totalPrice.value = cartsResponse.cart!.totalPrice!;
      totalPrice.value = cartsResponse.cart!.totalPrice!;
      print(totalPrice.value);
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
      int? redeemId = await getVoucherId();
      String? pickupTime;
      String? shiftDelivery;
      String? postsId = selectedPos.value?.id.toString();

      TimeOfDay timeFromString(String timeString) {
        final timeParts = timeString.split(':').map(int.parse).toList();
        return TimeOfDay(hour: timeParts[0], minute: timeParts[1]);
      }

      String currentTime = homePageView.displayTime();
      if (selectedMethod.value == 'on_delivery') {
        pickupTime = null;
        TimeOfDay time = timeFromString(currentTime);
        DateTime currentDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute);
        String formattedTime = DateFormat('HH:00').format(currentDateTime);
        shiftDelivery = formattedTime;
        postsId = selectedPos.value?.id.toString();
      } else if (selectedMethod.value == 'pickup') {
        pickupTime = selectedTime.value != TimeOfDay(hour: 8, minute: 0)
            ? "${selectedTime.value!.hour.toString().padLeft(2, '0')}:${selectedTime.value!.minute.toString().padLeft(2, '0')}"
            : '08:00';
        shiftDelivery = null;
        postsId = "Ambil di tempat";
      }

      print("Sending order data:");
      print("Cart ID: ${cartsResponse.cart?.id.toString()}");
      print("Method Type: ${selectedMethod.value}");
      print("Posts ID: ${postsId}");
      print("Voucher ID: ${redeemId}");
      print("Pickup time: ${pickupTime}");
      print("Shift delivery: ${shiftDelivery}");

      dio.FormData formData = dio.FormData.fromMap({
        'cart_id': cartsResponse.cart?.id.toString(),
        'method_type': selectedMethod.value.toString(),
        'posts_id': postsId.toString(),
        'user_voucher_id': redeemId?.toString() ?? '13',
        'pickup_time': pickupTime,
        'shift_delivery': shiftDelivery,
      });

      final response = await orderService.storeOrder(formData);
      print("Server response:");
      print(response.data);

      Get.snackbar("Success", "Order berhasil dibuat");
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
    var formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "000");
  }
}
