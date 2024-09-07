import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmOrderView extends GetView<OrderPageController> {
  ConfirmOrderView({super.key, required this.orderId, });

  final int orderId;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
              "Konfirmasi pesanan",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            )
          ],
        )

      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset(
                confirmOrder,
                width: screenWidth,
                height: 300,
              ),

              SizedBox(height: 5,),

              Center(
                child: Text(
                  "Pesanan kamu telah diantarkan",
                  style: txtTitlePage.copyWith(color: primaryColor),
                ),
              ),

              SizedBox(height: 5,),

              Center(
                child: Text(
                  "Silahkan konfirmasi pesanan ini, jika pesanan telah sampai.",
                  style: txtButtonTab,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 50,),

              CommonButton(
                  text: "Konfirmasi pesanan",
                  onPressed: (){
                    controller.confirmOrder(orderId.toString());
                    Get.offAndToNamed(Routes.HOME_PAGE, arguments: 1);
                  }
              ),

              SizedBox(height: 10,),

              Container(
                width: screenWidth,
                child: CommonButtonOutline(
                  color: primaryColor,
                  text: 'Tidak menemukan pesanan',
                  style: txtButtonTab.copyWith(color: primaryColor),
                  onPressed: () {  },
                ),
              ),

              SizedBox(height: 50,),

              // Text(
              //   "Jangan lupa tinggalkan penilaian 😉!!",
              //   style: txtButtonTab.copyWith(color: blackColor),
              // ),
              // SizedBox(height: 10,),
              //
              // CommonButtonOutline(
              //     text: "☆ Berikan penilaian",
              //     onPressed: (){
              //       Get.toNamed(Routes.REVIEW_PAGE);
              //     },
              //     txtColor: blackColor,
              //     borderColor: blackColor,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
