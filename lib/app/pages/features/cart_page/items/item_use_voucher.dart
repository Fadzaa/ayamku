import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemUseVoucher extends StatelessWidget {
  const ItemUseVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 15,bottom: 20,left: 16,right: 16),
        decoration: BoxDecoration(
          color: baseColor,
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
            Row(
              children: [
      
                SvgPicture.asset(
                  icVoucher,
                ),
      
                SizedBox(width: 5,),
      
                Text(
                  "Voucher",
                  style: txtButtonTab.copyWith(color: blackColor),
                )
      
              ],
            ),
      
            Row(
              children: [
      
                Text(
                    "Gunakan/ Masukkan code",
                  style: txtCaption.copyWith(color: blackColor50),
                ),
      
                SizedBox(width: 5,),
      
                SvgPicture.asset(
                  icArrow,
                  width: 22,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
