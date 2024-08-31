import 'dart:convert';
import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart'
    as cartResponse;
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/payment/payment_request.dart';
import 'package:ayamku_delivery/app/api/payment/payment_response.dart';
import 'package:ayamku_delivery/app/api/pos/model/PostResponse.dart';
import 'package:ayamku_delivery/app/api/voucher/model/voucherResponse.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../api/payment/payment_service.dart';

class CheckoutPageController extends GetxController {
  final homePageController = Get.put(HomePageController());
  final homePageView = Get.put(HomePageView());
  final pilihPosPageController = Get.put(PilihPosPageController());

  RxBool isLoading = false.obs;
  RxInt totalPrice = RxInt(0);
  RxInt id = RxInt(0);
  RxBool isTypeOrderSelect = true.obs;
  RxString selectedMethod = 'on_delivery'.obs;
  Rx<Pos?> selectedPos = Rx<Pos?>(null);
  var selectedTime = Rx<TimeOfDay?>(null);
  RxInt hour = 7.obs;
  RxInt minute = 0.obs;
  RxString voucherId = ''.obs;
  RxInt discount = 0.obs;



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

  //Payment
  PaymentService paymentService = PaymentService();
  PaymentResponse paymentResponse = PaymentResponse();
  String checkoutUrl = "";

  @override
  void onInit() {
    super.onInit();

    cartService = CartService();
    getCart();
    // loadSelectedPos();
    ever(pilihPosPageController.selectedPos, (pos) {
      selectedPos.value = pos;
    });

    checkStoreStatus();

    if(carts.status == "ordered") {
      Get.offNamed(Routes.SUCCESS_CHECKOUT);
    }
  }

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
    print("Loaded Pos: ${posJson}");
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

  Future<void> checkout() async {
    try {
      DateTime now = DateTime.now();


      DateTime pickupDateTime = DateTime(now.year, now.month, now.day, selectedTime.value!.hour, selectedTime.value!.minute);
      isLoading(true);
      int? redeemId = await getVoucherId();
      int? postsId = selectedPos.value?.id;
      String? pickupTime = DateFormat('HH:00').format(pickupDateTime);



      PaymentRequest paymentRequest = PaymentRequest(
        amount: totalPrice.value,
        payerEmail: cartsResponse.cart!.email!,
        pickupTime:pickupTime,
        cartId: cartsResponse.cart!.id,
        postsId: postsId,
        methodType: selectedMethod.value,
        userId: cartsResponse.cart!.userId!,
        userVoucherId: redeemId,
      );

      // if (pickupTime == null || selectedMethod.value == "pickup") {
      //   Get.snackbar("Info", "Silahkan pilih waktu pickup");
      //   return;
      // }

      // if (now.hour >= 12 || selectedMethod.value == "on_delivery") {
      //   Get.snackbar("Info", "Silahkan lakukan pesanan pickup");
      //   return;
      // }

      paymentResponse = await paymentService.payment(paymentRequest);

      checkoutUrl = paymentResponse.data!.checkoutLink!;
      print(paymentResponse.data);
      print("Checkout URL: $checkoutUrl");
      print("Checkout URL: ${paymentResponse.data!.checkoutLink}");

      Get.toNamed(Routes.CHECKOUT_WEBVIEW, arguments: checkoutUrl) ;

      update();
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
    return formattedPrice.replaceAll(",00", "");
  }

  WebViewController webViewController(String checkoutUrl) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            CircularProgressIndicator();
          },
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(checkoutUrl));
  }
}
