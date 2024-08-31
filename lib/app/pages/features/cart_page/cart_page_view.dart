import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/input_voucher/input_voucher_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
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
    final inputVoucherController = Get.put(InputVoucherController());
    double screenHeight = MediaQuery.of(context).size.height;
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

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
                if (controller.cartItems.isEmpty) {
                  return Center(
                      child: NotFoundPage(
                    image: imgEmptyCart,
                    title: "Uuupss.. kamu tidak memiliki item cart",
                  ));
                } else {
                  return RefreshIndicator(
                    onRefresh: controller.getCart,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cartItem = controller.cartItems[index];
                        return Obx(() => controller.isLoadingCartItems[index] ? commonLoading() : ItemCartMenu(
                          note: "saya mau pedas",
                          image: cartItem.productImage ?? '',
                          name: cartItem.productName ?? '',
                          quantity: cartItem.quantity ?? 0,
                          add: () => controller.incrementQuantity(cartItem, index),
                          min: () => controller.decrementQuantity(cartItem, index),
                          price: formatCurrency.format(
                              num.parse(cartItem.totalPrice.toString())),
                        ));
                      },
                    ),
                  );
                }
              })),
          Positioned(
            left: 0,
            right: 0,
            bottom: 95,
            child: FutureBuilder<String?>(
              future: controller.getVoucherCode(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return ItemUseVoucher(
                    useBorder: true,
                    usePadding: true,
                    voucherCode: snapshot.data ?? '',
                  );
                }
              },
            ),
          ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Obx(() {
          return CommonButtonPay(
            width: 150,
            text: 'Lanjutkan',
            color: controller.cartItems.isEmpty ? blackColor90 : primaryColor,
            txtColor: controller.cartItems.isEmpty ? blackColor40 : blackColor,
            // price: controller.getCart().then((_) => controller.formatPrice(controller.totalPrice.value)),
            price: controller.formatPrice(controller.totalPrice.value),
            onPressed: () {
              if(controller.cartItems.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CommonAlert(
                      title: 'Keranjang kamu kosong',
                      content: "Silahkan belanja terlebih dahulu",
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () async {
                        Get.back();
                        Get.offAllNamed(Routes.LIST_MAKANAN_PAGE,arguments: "Geprek");
                      },
                      confirmText: 'Belanja sekarang',
                      cancelText: 'Kembali',
                      image: "",
                    );
                  },
                );
              } else {
                Get.toNamed(Routes.CHECKOUT_PAGE);
              }
            },
          );
        })
      )
        ],
      ),
    );
  }
}
