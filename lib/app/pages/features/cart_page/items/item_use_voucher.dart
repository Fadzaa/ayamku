import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemUseVoucher extends StatelessWidget {
  const ItemUseVoucher({
    super.key,
    required this.voucherCode,
    this.usePadding = true,
    this.useBorder = true,
  });

  final String voucherCode;
  final bool usePadding;
  final bool useBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          Get.toNamed(Routes.INPUT_VOUCHER_PAGE);
        },
        child: Container(
          padding: usePadding ? EdgeInsets.only(top: 15,bottom: 20,left: 16,right: 16) : null,
          decoration: BoxDecoration(
            color: baseColor,
            border: useBorder ? Border.all(width: 1, color: Colors.grey) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [

                  Image.asset(
                    icVoucher,
                  ),

                  SizedBox(width: 5,),

                  Text(
                    "Voucher",
                    style: txtButtonTab.copyWith(color: blackColor),
                  )

                ],
              ),

              voucherCode.isEmpty
              ? Row(
                children: [

                  Text(
                    "Gunakan/ Masukkan code",
                    style: txtCaption.copyWith(color: blackColor50),
                  ),

                  SizedBox(width: 5),

                  SvgPicture.asset(
                    icArrow,
                    width: 22,
                  )
                ],
              )
              : DottedBorder(
                radius: Radius.circular(20),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                color: primaryColor,
                strokeWidth: 1,
                child: Text(
                  voucherCode,
                  style: txtCaption.copyWith(color: primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



