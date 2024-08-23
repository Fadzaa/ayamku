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
import 'package:ayamku_delivery/app/pages/features/cart_page/model/cart.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_view.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
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
  RxInt id = RxInt(0);
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
  List<cartResponse.CartItems> cartItems = <cartResponse.CartItems>[];
  cartResponse.Cart carts = cartResponse.Cart();
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
      cartItems.assignAll(cartsResponse.cart!.cartItems!);
      totalPrice.value = cartsResponse.cart!.totalPrice!;
      id.value = cartsResponse.cart!.id!;
      print(totalPrice.value);

      print("Parsed carts:");
      print(cartItems);
      print(totalPrice);

      update();

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
        if (selectedTime.value != TimeOfDay(hour: 8, minute: 0)) {
          DateTime pickupDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, selectedTime.value!.hour, selectedTime.value!.minute);
          pickupTime = DateFormat('HH:00').format(pickupDateTime);
        } else {
          pickupTime = '08:00';
        }
        shiftDelivery = null;
        postsId = 1.toString();
      }

      dio.FormData formData = dio.FormData.fromMap({
        'cart_id': cartsResponse.cart?.id!,
        'method_type': selectedMethod.value.toString(),
        'posts_id': postsId.toString(),
        'user_voucher_id': redeemId?.toString(),
        'shift_delivery': shiftDelivery?.toString(),
        'pickup_time': pickupTime?.toString(),
      });

      print("FormData: ${formData.fields}");

      final response = await orderService.storeOrder(formData);
      print("Server response:");
      print(response.data);

      Get.snackbar(
        "Orderan kamu berhasil",
        "Silahkan periksa orderan kamu di halaman order",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
      // Get.offAllNamed(Routes.HOME_PAGE, arguments: 1);
      Get.offAllNamed(Routes.ORDER_PAGE, arguments: 1);
    } catch (e) {
      if (selectedPos.value?.id == null || selectedTime.value == null || selectedMethod.value == null) {
        Get.snackbar(
          "Orderan kamu gagal",
          "Silahkan periksa orderan kamu",
          backgroundColor: redAlert,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: EdgeInsets.all(10),
        );
        return;
      }
    } finally {
      isLoading(false);
    }
  }




  String formatPrice(int price) {
    var formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }
}
