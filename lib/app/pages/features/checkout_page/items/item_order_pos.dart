import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPos extends StatelessWidget {
  const OrderPos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "📌 Pos pengiriman",
          style: txtListItemTitle.copyWith(color: blackColor20)
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Text("Pos 1 - ",style: txtSecondaryTitle.copyWith(color: blackColor40),),
                      Text("Gazebo ",style: txtSecondaryTitle.copyWith(color: blackColor40),),

                    ],
                  ),

                  Text("Terletak di gazebo dekat gerbang kedua. ",style: txtSecondaryTitle.copyWith(color: blackColor40),)

                ],
              ),

              SvgPicture.asset(
                icArrowLeft,
                width: 30,
                height: 30,
              ),
            ],
          ),
        )

      ],
    );
  }
}
