import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemSectionPaymentSummary extends GetView<DetailOrderPageController> {
  const ItemSectionPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    return Column(
      children: [

        ContainerPaySection(
          text: 'SubTotal',
          subText: 'Total awal',
        ),

        ContainerPaySection(
          text: 'Potongan voucher',
          subText:controller.formatPrice(argument['discount_amount']),
        ),

        SizedBox(height: 15,),

        Divider(
          color: blackColor80,
          thickness: 0.5
        ),

        SizedBox(height: 15,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Total",
              style: txtHeadline3.copyWith(color: blackColor),
            ),

            Text(
              controller.formatPrice(argument['final_amount']),
              style: txtHeadline3.copyWith(color: blackColor),
            )

          ],
        )
      ],
    );
  }
}

class ContainerPaySection extends StatelessWidget {
  const ContainerPaySection({
    super.key,
    required this.subText,
    required this.text
  });

  final String subText, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          text,
          style: txtSecondaryTitle.copyWith(color: blackColor40),
        ),

        Text(
          subText,
          style: txtSecondaryTitle.copyWith(color: blackColor40),
        )

      ],
    );
  }
}



