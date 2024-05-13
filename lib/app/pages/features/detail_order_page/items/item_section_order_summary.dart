import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemSectioOrderSummary extends StatelessWidget {
  const ItemSectioOrderSummary({
    super.key,
    required this.noPesanan,
    required this.waktuPesanan,
    required this.metodePesanan
  });

  final String noPesanan, waktuPesanan, metodePesanan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "No. Pesanan",
              style: txtHeadline3,
            ),

            Row(
              children: [

                Text(
                  noPesanan,
                  style: txtSecondaryTitle,
                ),

                SizedBox(width: 10,),

                SvgPicture.asset(
                  icCopy,
                  width: 24,
                ),

              ],
            )

          ],
        ),

        SizedBox(height: 10,),

        Column(
          children: [

            WidgetRowSectionLast(
                text: "Waktu pemesanan",
                subText: waktuPesanan
            ),

            SizedBox(height: 6,),

            WidgetRowSectionLast(
                text: "Metode pemesanan",
                subText: metodePesanan
            ),

          ],
        )
      ],
    );
  }
}

class WidgetRowSectionLast extends StatelessWidget {
  const WidgetRowSectionLast({
    super.key,
    required this.text,
    required this.subText
  });

  final String text, subText;

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
        ),

      ],
    );
  }
}

class ItemSectionOrderMenu extends StatelessWidget {
  const ItemSectionOrderMenu({
    super.key,
    required this.image,
    required this.name,
    required this.level,
    required this.drink,
    required this.price,
    required this.quantity
  });

  final String image,name,level,drink,price,quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset(
                image,
              width: 43,
              height: 42,
            ),

            SizedBox(width: 10,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    Text(
                      quantity,
                      style: txtSecondaryTitle.copyWith(color: blackColor),
                    ),

                    SizedBox(width: 10,),

                    Text(
                      name,
                      style: txtSecondaryTitle.copyWith(color: blackColor30),
                    )
                  ],
                ),

                Row(
                  children: [

                    Text(
                      level,
                      style: txtSecondaryTitle.copyWith(color: blackColor),
                    ),

                    SizedBox(width: 10,),

                    Text(
                      "+",
                      style: txtSecondaryTitle.copyWith(color: blackColor),
                    ),

                    SizedBox(width: 10,),

                    Text(
                      drink,
                      style: txtSecondaryTitle.copyWith(color: blackColor),
                    )
                  ],
                )
              ],
            ),

          ],
        ),

        Text(
          price,
          style: txtSecondaryTitle.copyWith(color: blackColor),
        )
      ],
    );
  }
}


