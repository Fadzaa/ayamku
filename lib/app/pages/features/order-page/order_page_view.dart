import 'package:ayamku_delivery/app/pages/features/order-page/item/item_select_order.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_dalam_proses.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_riwayat.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderPageView extends GetView<OrderPageController>{
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
                "Order saya",
              style: txtTitlePage.copyWith(
                  color: blackColor
              ),
            ),

            InkWell(
              onTap: (){
                Get.toNamed(Routes.CART_PAGE);
              },
              child: SvgPicture.asset(
                icCart,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                ItemSelectOrder(),

              ],
            ),
          ),
        ),
      ),
    );
  }

}