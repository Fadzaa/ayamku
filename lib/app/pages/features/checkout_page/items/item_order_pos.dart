import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class OrderPos extends StatelessWidget {
  OrderPos({super.key});

  final controller = Get.put(CheckoutPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pos = controller.selectedPos.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("📌 Pos pengiriman", style: txtListItemTitle.copyWith(color: blackColor20)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Pos 1 - ", style: txtSecondaryTitle.copyWith(color: blackColor40)),
                          Expanded(
                              child: Text(
                                  pos?.name ?? "Gazebo",
                                  style: txtSecondaryTitle.copyWith(color: blackColor40),
                                maxLines: 1,
                              )
                          ),
                        ],
                      ),

                      SizedBox(height: 5,),

                      AutoSizeText(
                        pos?.description ?? "Terletak di depan gerbang",
                        style: txtSecondaryTitle.copyWith(color: blackColor40),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PILIH_POS_PAGE);
                  },
                  child: SvgPicture.asset(
                    icArrowLeft,
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

