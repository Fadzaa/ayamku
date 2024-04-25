import 'dart:ffi';

import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_quantity.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemTitle extends StatelessWidget {
  ItemTitle({
    super.key,
    required this.title,
    required this.quantity,
    required this.rating,
    required this.description,
    required this.add,
    required this.min,
  });

  final String title,description;
  final int quantity;
  final double rating;
  final VoidCallback? add,min;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SvgPicture.asset(
                        icStar,
                        width: 22,
                        height: 22,
                      ),

                      SizedBox(width: 5,),

                      Text(
                        rating.toString(),
                        style: txtRating.copyWith(color: blackColor30),
                      )

                    ],
                  ),

                  SizedBox(height: 3,),

                  Text(
                    title,
                    style: txtTitleMenu,
                  )
                ],
              ),

              Row(
                children: [

                  ItemQuantity(
                      icon: icAdd,
                      onPressed: add
                  ),

                  SizedBox(width: 15,),

                  Text(
                    quantity.toString(),
                    style: txtListItemTitle,
                  ),

                  SizedBox(width: 15,),

                  ItemQuantity(
                      icon: icMin,
                      onPressed: min
                  ),

                ],
              )
            ],
          ),

          SizedBox(height: 10,),

          Text(
            description,
            style: txtSecondaryTitle,
          ),
        ],
      );
  }
}