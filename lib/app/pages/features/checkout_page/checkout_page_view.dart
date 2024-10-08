import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_cart_menu.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_use_voucher.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_checkout_menu.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_order_pos.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_pay_summary.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_pickup_date.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_select_metode.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_select_payment.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_slot_delivery.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPageView extends GetView<CheckoutPageController> {
  const CheckoutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final pos = controller.selectedPos.value;
    print("Selected Pos: ${pos?.name}");

    return Scaffold(
      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [

              InkWell(
                onTap: (){
                  Get.back();
                },
                child: SvgPicture.asset(
                  icBack,
                  width: 30,
                  height: 30,
                ),
              ),

              SizedBox(width: 10,),

              Text(
                "Order",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          height: screenHeight,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getCart();
              controller.getVoucherCode();
              controller.loadSelectedPos();
            },
            child: SingleChildScrollView(
              child: Obx((){
                if(controller.isLoading.value){
                  return commonLoading();
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.getCart();
                    },
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cartItem = controller.cartItems[index];
                            return ItemCheckoutMenu(
                              image: cartItem.productImage ?? "",
                              name: cartItem.productName ?? "",
                              price: formatCurrency.format(num.parse(cartItem.totalPrice.toString())),
                              quantity: cartItem.quantity.toString(),
                            );
                          },
                        ),

                        SizedBox(height: 20,),

                        ItemSelectMetode(),

                        SizedBox(
                          height: 15,
                        ),

                        FutureBuilder<String?>(
                          future: controller.getVoucherCode(),
                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else {
                              return ItemUseVoucher(
                                useBorder: false,
                                usePadding: false,
                                voucherCode: snapshot.data ?? '',
                              );
                            }
                          },
                        ),

                        SizedBox(height: 20,),


                        ItemSelectPayment(),

                        // ItemPaySummary(),


                      ],
                    ),
                  );
                }
              }),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx((){
        return CommonButtonPay(
          width: 150,
          text: 'Lanjutkan',
          price: controller.formatPrice(controller.totalPrice.value),
          onPressed: () => controller.checkout(),
        );
      }),
    );
  }
}
