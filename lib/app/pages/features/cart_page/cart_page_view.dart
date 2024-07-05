import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/input_voucher/input_voucher_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_cart_menu.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_use_voucher.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:intl/intl.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartPageController());
    final inputVoucherController = Get.put(InputVoucherController());
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: baseColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Text("Keranjang", style: txtTitlePage),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            padding: EdgeInsets.only(left: 16, right: 16, top: 15),
            decoration: BoxDecoration(color: baseColor),
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItem = controller.cartItems[index];
                    return ItemCartMenu(
                      image: exampleFood,
                      name: cartItem.productName ?? '',
                      quantity: cartItem.quantity.toString(),
                      add: () => controller.incrementQuantity,
                      min: () => controller.decrementQuantity,
                      price: formatCurrency.format(num.parse(cartItem.totalPrice.toString())),
                    );
                  },
                );
              }
            })
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 95,
            child: ItemUseVoucher(
              voucherCode: inputVoucherController.redeemedVoucherCode,
            )),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CommonButtonPay(
              width: 150,
              text: 'Checkout',
              price: controller.totalPrice,
              onPressed: () {
                Get.toNamed(Routes.CHECKOUT_PAGE);
              },
            )
          ),
        ],
      ),
    );
  }
}

