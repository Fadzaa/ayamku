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
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    int currentMinute = now.minute;

    if ((currentHour == 7 && currentMinute >= 0) || (currentHour == 8) || (currentHour == 9 && currentMinute <= 20)) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 9, 40));
    } else if ((currentHour == 9 && currentMinute >= 21) || (currentHour == 10) || (currentHour == 11 && currentMinute <= 40)) {
      return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, 12, 0));
    } else {
      return "Pickup";
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
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getCurrentUser();
              controller.getAllProductTerlaris();
              controller.getAllActivePromo();
              controller.getStore();
              controller.fetchToken();
            },
              child: SingleChildScrollView(
                child: Container(
                  color: baseColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text.rich(
                          TextSpan(
                              text: controller.storeStatus == 1
                                  ? (displayTime() != "Pickup" ? "Pengantaran dilakukan pada " : "OnDelivery selesai, lakukan ")
                                  : "Toko sedang tutup",
                              style: txtHeadline2,
                              children: controller.storeStatus == 1
                                  ? [
                                TextSpan(
                                  text: displayTime() != "Pickup" ? displayTime() : "pickup",
                                  style: txtHeadline2.copyWith(
                                      color: primaryColor),
                                ),
                                TextSpan(
                                  text: displayTime() != "Pickup" ? "\n*Anda dapat melakukan pesanan pickup, jika tidak ingin menunggu" : "",
                                  style: txtCaption.copyWith(
                                      color: blackColor50),
                                )
                              ]
                                  : []),
                        ),),
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
                        // Text(
                        //   "Promo Waktu Terbatas",
                        //   style: txtHeadline3.copyWith(color: blackColor),
                        // ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Obx(() => controller.isLoadingPromo.value ? commonLoading() : ItemPromoVertical()),
                      ],
                    ),
                  ),
                ),
              ))
        ));
  }
}
