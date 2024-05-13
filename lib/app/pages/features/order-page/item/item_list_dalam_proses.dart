import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemListDalamProses extends StatelessWidget {

  const ItemListDalamProses({
    super.key,
    required this.image,
    required this.name,
    required this.date
  });

  final String image, name, date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              name,
              style: txtSecondaryTitle,
            ),

            SizedBox(height: 4,),

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
