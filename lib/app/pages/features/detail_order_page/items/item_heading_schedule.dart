import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemHeadingSchedule extends StatelessWidget {
  const ItemHeadingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
      decoration: BoxDecoration(
        color: greyWarning,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                "Pesanan terjadwal ",
                style: txtListItemTitle.copyWith(color: blackColor),
              ),

              SizedBox(height: 5,),

              Text(
                "Silahkan tunggu, hingga admin mengkonfimasi \n pesanan yang telah dijadwalkan",
                style: txtCaption.copyWith(color: blackColor),
              )

            ],
          ),

          Image.asset(
            icScheduleOrder,
            width: 52,
          )

        ],
      ),
    );
  }
}
