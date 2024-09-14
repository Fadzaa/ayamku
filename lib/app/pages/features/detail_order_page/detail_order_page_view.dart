import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_order_pos.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_heading_complete_order.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/section/section_last.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/section/section_order_summary.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/section/section_track_order.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailOrderPageView extends GetView<DetailOrderPageController> {
  DetailOrderPageView({super.key});

  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: baseColor,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.HOME_PAGE, arguments: 1);
                  },
                  child: SvgPicture.asset(
                    icBack,
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Detail Order",
                  style: txtTitlePage.copyWith(
                    color: blackColor,
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (argument["status"] == "completed" ||
                      argument["status"] == "confirmed_order")
                    ItemCompleteOrder(),

                  SizedBox(height: 20),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Order id",
                            style: txtHeadline3,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(argument['orderId'] ?? ""),
                              InkWell(
                                  onTap: (){
                                    Clipboard.setData(ClipboardData(text: argument['orderId'])).then((value) {
                                      Get.snackbar('Berhasil', 'Order ID berhasil disalin');
                                    });
                                  },
                                  child: SvgPicture.asset(icCopy)),
                            ],
                          ),
                        ],
                      )),

                  SizedBox(height: 20),
                  // SectionTrackOrder(),
                  // Divider(color: blackColor70, thickness: 0.5),
                  SectionOrderSummary(),
                  if (argument["status"] == "completed" ||
                      argument["status"] == "confirmed_order")
                    SectionLast(
                      sendReview: () {
                        print('Review : ${argument["review"]}');
                        if ((argument["review"] as List).isEmpty) {
                          Get.toNamed(Routes.REVIEW_PAGE, arguments: {
                            "orderId": argument["orderId"],
                            "cartItems": argument["cartItems"]
                          });
                        } else {
                          Get.offNamed(Routes.SEE_REVIEW_PAGE, arguments: {
                            "review": argument["review"],
                          });
                          print('Review Data: ${argument["review"]}');
                        }
                      },
                      txt: (argument["review"] as List).isEmpty
                          ? 'Kirim Penilaian'
                          : 'Lihat Penilaian',
                    ),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
        if (argument["status"] == "completed" ||
            argument["status"] == "confirmed_order ")
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: baseColor,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: CommonButton(
                text: 'Beli lagi',
                onPressed: () {},
              ),
            ),
          )
      ],
    );
  }
}
