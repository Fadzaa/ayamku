import 'package:ayamku_delivery/app/pages/features/review_order_page/review_order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'items/items_menu_review.dart';

class ReviewOrderPageView extends GetView<ReviewOrderPageController> {
  const ReviewOrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: baseColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: SvgPicture.asset(
                //     icBack,
                //     width: 30,
                //     height: 30,
                //   ),
                // ),
                Text(
                  "Penilaian Pesanan ",
                  style: txtHeadline2.copyWith(
                    color: primaryColor,
                  ),
                ),
                Spacer(),
                // Text(
                //   "Kirim",
                //   style: txtTitlePage.copyWith(color: primaryColor),
                // ),
              ],
            )),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: baseColor,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  (argument != null &&
                          argument['cartItems'] != null &&
                          argument['cartItems'].length > 0)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: argument['cartItems'].length,
                          itemBuilder: (context, index) {
                            final cartItems = argument['cartItems'][index];
                            return Expanded(
                              child: ItemsMenuReview(
                                image: exampleFood,
                                title: cartItems.productName,
                                id: cartItems.id,
                              ),
                            );
                          },
                        )
                      : Text("Maaf, anda tidak memiliki List Order"),
                ],
              )),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: baseColor,
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: CommonButton(
            text: "Kirimkan penilaian",
            onPressed: () {
              controller.storeReviews(argument["cartItems"], argument["orderId"]);
            },
          ),
        ));
  }
}
