import 'package:ayamku_delivery/app/pages/global_component/common_search.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'home_page_controller.dart';
import 'items/item_cattegory_horizontal.dart';
import 'items/item_promo_horizontal.dart';
import 'items/item_recommend_horizontal.dart';


class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              logoPrimary,
              width: 57,
            ),

            Row(
              children: [
                SvgPicture.asset(icChat),
                SizedBox(width: 5),
                SvgPicture.asset(icNotif),
                SizedBox(width: 5),
                SvgPicture.asset(icCart),
              ],
            )
          ],
        ),
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),

                Text.rich(
                  TextSpan(
                      text: "Order will be at ",
                      style: txtHeadline2,
                      children: [
                        TextSpan(
                          text: "12.00",
                          style: txtHeadline2.copyWith(
                              color: primaryColor
                          ),
                        )
                      ]
                  ),
                ),
                Text(
                  "Delivering",
                  style: txtBody.copyWith(
                    color: primaryColor
                ),),

                SizedBox(height: 10,),

                CommonSearch(text: "Temukan makanan yang kamu inginkan"),

                SizedBox(height: 10,),

                ItemPromoHorizontal(),

                SizedBox(height: 15,),

                Text(
                  "Cattegory",
                  style: txtHeadline3.copyWith(
                      color: blackColor
                  ),),

                SizedBox(height: 15,),

                ItemCattegoryHorizontal(),

                SizedBox(height: 15,),

                  Text(
                    "Promoo Waktu Terbatas",
                    style: txtHeadline3.copyWith(
                        color: blackColor
                    ),),

                SizedBox(height: 15,),

                ItemRecommendHorizontal()
              ],
            ),
          ),
        ),
      )
    );
  }
}










