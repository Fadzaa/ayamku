import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemSectionPaymentSummary extends StatelessWidget {
  const ItemSectionPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ContainerPaySection(
          text: 'SubTotal',
          subText: 'Rp.11.000',
        ),

        ContainerPaySection(
          text: 'Biaya admin',
          subText: 'Rp.5000',
        ),

        ContainerPaySection(
          text: 'Potongan pengguna baru',
          subText: '-Rp.7000',
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
              "Rp. 11.000",
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



