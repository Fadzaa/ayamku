import 'package:ayamku_delivery/app/pages/features/home_page/items/item_drawer.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/items/item_select_pos.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/theme.dart';
import 'home_page_controller.dart';
import 'items/item_cattegory_horizontal.dart';
import 'items/item_promo_vertical.dart';
import 'items/item_terlaris_horizontal.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  String displayTime() {
    int currentHour = DateTime.now().hour;
    DateTime now = DateTime.now();
    if (currentHour >= 10 && currentHour < 12) {
      return DateFormat('HH:mm')
          .format(DateTime(now.year, now.month, now.day, 12, 0));
    } else if (currentHour >= 7 && currentHour < 10) {
      return DateFormat('HH:mm')
          .format(DateTime(now.year, now.month, now.day, 9, 40));
    } else {
      return "besok";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ItemDrawer(),
        appBar: AppBar(
          backgroundColor: baseColor,
          // foregroundColor: baseColor,
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
        body: SafeArea(
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
                          text: controller.storeStatus == 1
                              ? "Pemesanan dilakukan pada "
                              : "Toko sedang tutup",
                          style: txtHeadline2,
                          children: controller.storeStatus == 1
                              ? [
                            TextSpan(
                              text: displayTime(),
                              style: txtHeadline2.copyWith(
                                  color: primaryColor),
                            )
                          ]
                              : []),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ItemSelectPos(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Kategori Menu",
                      style: txtHeadline3.copyWith(color: blackColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ItemCattegoryHorizontal(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Makanan Terlaris",
                      style: txtHeadline3.copyWith(color: blackColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => controller.isLoadingProduct.value ? commonLoading() : ItemTerlarisHorizontal()),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Promo Waktu Terbatas",
                      style: txtHeadline3.copyWith(color: blackColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => controller.isLoadingPromo.value ? commonLoading() : ItemPromoVertical()),

                  ],
                ),
              ),
            ),
          )
        ));
  }
}
