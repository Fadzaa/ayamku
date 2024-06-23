import 'package:ayamku_delivery/app/pages/features/home_page/items/item_drawer.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/items/item_select_pos.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'home_page_controller.dart';
import 'items/item_cattegory_horizontal.dart';
import 'items/item_promo_vertical.dart';
import 'items/item_terlaris_horizontal.dart';


class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  String displayTime() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 10 && currentHour < 12) {
      return "12.00";
    } else if (currentHour >= 7 && currentHour < 9) {
      return "09.40";
    } else {
      return "tomorrow";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ItemDrawer(),
        appBar: AppBar(
          backgroundColor: baseColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Ayamku Delivery",
                style: txtListItemTitle,
              ),

              Image.asset(
                logoPrimary,
                width: 57,
              ),
            ],
          ),
        ),
        body:  SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: baseColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text.rich(
                      TextSpan(
                          text: controller.storeStatus == 1 ? "Order will be at " : "Toko sedang tutup",
                          style: txtHeadline2,
                          children: controller.storeStatus == 1 ? [
                            TextSpan(
                              text: displayTime(),
                              style: txtHeadline2.copyWith(
                                  color: primaryColor
                              ),
                            )
                          ] : []
                      ),
                    ),

                    SizedBox(height: 15,),

                    ItemSelectPos(),

                    SizedBox(height: 15,),

                    Text(
                      "Category",
                      style: txtHeadline3.copyWith(
                          color: blackColor
                      ),),

                    SizedBox(height: 15,),

                    ItemCattegoryHorizontal(),

                    SizedBox(height: 15,),

                    Text(
                      "Makanan Terlaris",
                      style: txtHeadline3.copyWith(
                          color: blackColor
                      ),),

                    SizedBox(height: 15,),

                    ItemTerlarisHorizontal(listMenuTerlaris: controller.listProduct,),

                    SizedBox(height: 15,),

                    Text(
                      "Promo Waktu Terbatas",
                      style: txtHeadline3.copyWith(
                          color: blackColor
                      ),),

                    SizedBox(height: 15,),

                    ItemPromoVertical(listActivePromo:controller.listPromo)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
