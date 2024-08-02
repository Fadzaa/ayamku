import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPesananKamu extends StatelessWidget {
  const ItemPesananKamu(
      {super.key,
      required this.image,
      required this.name,
      required this.date,
      required this.status});

  final String image, name, date, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: txtSecondaryTitle,
                ),

                SizedBox(
                  width: 10,
                ),

                Text(
                  ": $status",
                  style: txtSecondaryTitle.copyWith(color: primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              date,
              style: txtSecondaryTitle.copyWith(color: blackColor40),
            ),
          ],
        ),

        Image.asset(
          image,
          width: 60,
        ),
      ],
    );
  }
}
