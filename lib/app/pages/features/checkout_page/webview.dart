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
    return WillPopScope(
      onWillPop: () async {
        await controller.navigateToLatestOrder();


        // Get.offNamedUntil(Routes.SUCCESS_CHECKOUT, (route) => route.settings.name == Routes.CART_PAGE);
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
