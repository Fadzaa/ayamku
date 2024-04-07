import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWarningBox extends StatelessWidget {
  const ItemWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyWarning,
        ),

        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            children: [

              SvgPicture.asset(
                icCircle,
              ),

              SizedBox(width: 5,),

              Text(
                "Rekomendasi pos terdekat di bawah ini, berdasarkan\n kelas dan jurusan yang kamu masukkan sebelumnya",
                style: txtCaption.copyWith(color: blackColor),
              ),
            ],
          ),
        ),
      );
  }
}
