import 'package:ayamku_delivery/app/pages/features/order-page/confirm_order_view.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListRiwayat extends StatelessWidget {
  const ItemListRiwayat({super.key, required this.image, required this.name, required this.date});

  final String image, name, date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.DETAIL_ORDER_PAGE);
      },
      child: Row(
        children: [

          Image.asset(
            image,
            width: 60,
          ),

          SizedBox(width: 15,),

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

        ],
      ),
    );
  }
}

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ConfirmOrderView());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor)
        ),

        child: Text(
          "Konfirmasi Pesanan",
          style: txtCaption.copyWith(color: primaryColor),),
      ),
    );
  }
}

class ButtonBuy extends StatelessWidget {
  const ButtonBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor)
        ),

        child: Text(
            "Beli Lagi",
          style: txtCaption.copyWith(color: blackColor),
        ),
      ),
    );
  }
}


