import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends GetView<CheckoutPageController> {
  final int? index;
  const WebView({this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderPageController());
    final data = orderController.myOrder.value.last;

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
    return WillPopScope(
      onWillPop: () async {
        // Get.offNamedUntil(
        //     Routes.DETAIL_ORDER_PAGE,
        //         (route) => route.settings.name == Routes.CART_PAGE,
        //     arguments: {
        //       'orderId': data.id.toString(),
        //       'cartItems': data.cart?.cartItems,
        //       'status' : data.status.toString(),
        //       'date': DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(data.createdAt.toString())),
        //       'method' : data.methodType.toString(),
        //       'voucher' : data.voucher.toString(),
        //       'final_amount' : int.tryParse(data.finalAmount.toString()) ?? 0,
        //       'discount_amount' : int.tryParse(data.discountAmount.toString()) ?? 0,
        //       'pickup_time' : formatPickupTime(data.pickupTime.toString(),),
        //       'shift_delivery' : data.shiftDelivery.toString(),
        //       'originalAmount' : int.tryParse(data.originalAmount.toString()) ?? 0,
        //       'review' : data.reviews,
        //       'namePos' : data.post?.name.toString(),
        //       'descPos' : data.post?.description.toString(),
        //       'payment' : data.paymentMethod,
        //     }
        // );

        Get.offNamedUntil(Routes.SUCCESS_CHECKOUT, (route) => route.settings.name == Routes.CART_PAGE);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: baseColor,
            title: Text('Checkout', style: txtHeadline3,),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Get.toNamed(Routes.LOGIN_PAGE),
            )
        ),
        body: WebViewWidget(controller: controller.webViewController(Get.arguments)),
      ),
    );
  }
}
