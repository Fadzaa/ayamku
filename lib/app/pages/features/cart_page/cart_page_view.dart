import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_cart_menu.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/items/item_use_voucher.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartPageView extends GetView<CartPageController>{
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
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

                SizedBox(width: 10,),

                Text(
                  "Keranjang",
                  style: txtTitlePage
                )
              ],
            ),
          ),

          body: Container(
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 80,top: 15),
            decoration: BoxDecoration(
                color: baseColor
            ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount : food_data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCartMenu(
                    image: food_data[index].image,
                    name: food_data[index].name,
                    quantity: controller.quantityCount,
                    add: controller.inCrementQuantity,
                    min: controller.decrementQuantity,
                    price: food_data[index].price,
                  );
                },
              )
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: ItemUseVoucher(),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CommonButtonPay(
            width: 150,
            text: 'Checkout ',
            price: 'Rp.13.000',
          ),
        ),

      ]
    );
  }

}