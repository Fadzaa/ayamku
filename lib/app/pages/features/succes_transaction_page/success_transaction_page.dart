import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/items/item_cart.dart';
import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/succes_transaction_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SuccessTransactionPage extends GetView<SuccesTransactionController> {
  const SuccessTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: baseColor
        ),
        child: Center(
          child: Obx(() {
            if (controller.cartItems.isEmpty){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(successPay),

                  const SizedBox(height: 20),

                  Text(
                    'Pembayaran berhasil ! ',
                    style: txtButtonTab.copyWith(
                        color: primaryColor
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'Pembayaran kamu berhasil, silahkan cek orderan kamu ',
                    style: txtButtonTab.copyWith(
                        color: blackColor
                    ),
                  ),

                  const SizedBox(height: 35),

                  CommonButton(
                      width: 220,
                      text: "Lihat pesanan kamu",
                      onPressed: (){
                        Get.offAllNamed(Routes.HOME_PAGE, arguments: 1);
                      }
                  )
                ],
              );
            } else {
              return RefreshIndicator(
                onRefresh: controller.getCart,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cartItem = controller.cartItems[index];
                        return Obx(() => controller.isLoadingCartItems[index] ? commonLoading() : ItemCart(
                          image: cartItem.productImage ?? '',
                          name: cartItem.productName ?? '',
                          price: formatCurrency.format(
                              num.parse(cartItem.totalPrice.toString())),
                          quantity: cartItem.quantity ?? 0,
                        )
                        );
                      },
                    ),

                    const SizedBox(height: 35),

                    CommonButton(
                        width: 220,
                        text: "Lakukan orderan lagi",
                        onPressed: (){
                          Get.offAllNamed(Routes.ORDER_PAGE);
                        }
                    )
                  ],
                ),
              );
            }
          })
        ),
      ),
    );
  }
}