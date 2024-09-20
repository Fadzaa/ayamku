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
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
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
  final orderController = Get.put(OrderPageController());
  final homePageController = Get.put(HomePageController());
  final homePageView = Get.put(HomePageView());
  final pilihPosPageController = Get.put(PilihPosPageController());

  bool get isStoreClosed {
    return DateTime.now().hour > 14;
  }

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

  RxString dropdownValuePayment = "Cash".obs;
  void onChangePayment(String selectPayment, List<String> items) {
    dropdownValuePayment.value = selectPayment;
    items.remove(selectPayment);
    items.insert(0, selectPayment);
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

    TimeOfDay now = TimeOfDay.now();

    if ((time.hour < now.hour) || (time.hour == now.hour && time.minute < now.minute)) {
      Get.snackbar("Error", "Waktu pengambilan tidak boleh sebelum waktu sekarang.");
    } else {
    
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
      // print('Error: $e');
      // Get.snackbar("Error", e.toString());
      // print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> checkout() async {
    try {
      isLoading(true);

      DateTime now = DateTime.now();
      int? redeemId = await getVoucherId();
      int? postsId = selectedPos.value?.id;

      if (dropdownValuePayment.value == "Cash") {

        var formData = dio.FormData.fromMap({
          'cart_id': cartsResponse.cart!.id,
          'method_type': selectedMethod.value,
          'posts_id': postsId,
          'pickup_time': selectedMethod.value == "pickup" ? DateFormat('HH:00').format(DateTime(now.year, now.month, now.day, selectedTime.value!.hour, selectedTime.value!.minute)) : null,
          'user_voucher_id': redeemId,
          'payment_method': 'cash',
        });

        await orderService.storeOrder(formData);
        await orderController.getOrder();
        await navigateToLatestOrder();

      } else if (dropdownValuePayment.value == "E-Wallet") {

        PaymentRequest paymentRequest = PaymentRequest(
          amount: totalPrice.value,
          payerEmail: cartsResponse.cart!.email!,
          pickupTime: selectedMethod.value == "pickup" ? DateFormat('HH:00').format(DateTime(now.year, now.month, now.day, selectedTime.value!.hour, selectedTime.value!.minute)) : null,
          cartId: cartsResponse.cart!.id,
          postsId: postsId,
          methodType: selectedMethod.value,
          userId: cartsResponse.cart!.userId!,
          userVoucherId: redeemId,
        );

        paymentResponse = await paymentService.payment(paymentRequest);

        checkoutUrl = paymentResponse.data!.checkoutLink!;

        await orderController.getOrder();

        Get.toNamed(Routes.CHECKOUT_WEBVIEW, arguments: checkoutUrl);
      }

      Get.snackbar(
        "Sukses",
        "Orderan berhasil dibuat!",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );

      update();
    } catch (e) {
      if (selectedMethod.value == "pickup" && selectedTime.value == null) {
        Get.snackbar(
          "Gagal",
          "Tambahkan waktu pengambilan!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: EdgeInsets.all(10),
        );
        return;
      } else if (selectedMethod.value == "on_delivery" && selectedPos.value?.id == null) {
        Get.snackbar(
          "Orderan gagal",
          "Pos masih kosong, silahkan pilih pos terlebih dahulu!",
          backgroundColor: Colors.red,
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
  String formatPickupTime(String time) {
    if (time.isEmpty) {
      return "Waktu tidak tersedia";
    }

    try {
      DateTime parsedTime = DateFormat("HH:mm:ss").parse(time);
      return DateFormat("HH.mm").format(parsedTime);
    } catch (e) {

      return "Format waktu salah";
    }
  }
  Future<void> navigateToLatestOrder() async {
    await orderController.getOrder();
    print(orderController.myOrder.value);
    final sortedOrders = List<Data>.from(orderController.myOrder.value)
      ..sort((a, b) => DateFormat('yyyy-MM-ddTHH:mm:ss').parse(b.createdAt ?? '').compareTo(DateFormat('yyyy-MM-ddTHH:mm:ss').parse(a.createdAt ?? '')));
    final data = sortedOrders.first;
    print("Latest order ID: ${data.id}");

    Get.offNamedUntil(
        Routes.DETAIL_ORDER_PAGE,
            (route) => route.settings.name == Routes.ORDER_PAGE,
        arguments: {
          'orderId': data.id.toString(),
          'cartItems': data.cart?.cartItems,
          'status': data.status.toString(),
          'date': DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(data.createdAt.toString())),
          'method': data.methodType.toString(),
          'voucher': data.voucher.toString(),
          'final_amount': int.tryParse(data.finalAmount.toString()) ?? 0,
          'discount_amount': int.tryParse(data.discountAmount.toString()) ?? 0,
          'pickup_time': formatPickupTime(data.pickupTime.toString()),
          'shift_delivery': data.shiftDelivery.toString(),
          'originalAmount': int.tryParse(data.originalAmount.toString()) ?? 0,
          'review': data.reviews,
          'namePos': data.post?.name.toString(),
          'descPos': data.post?.description.toString(),
          'payment': data.paymentMethod,
        }
    );
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
