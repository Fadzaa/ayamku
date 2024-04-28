import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSelectPos extends StatelessWidget {
  const ItemSelectPos({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 172,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "📌 Pilih pos terdekat  ",
                        style: txtListItemTitle,
                      ),

                      SizedBox(height: 10,),

                      Text(
                        "Temukan pos terdekat untuk\n menjemput pesanan kamu!",
                        style: txtCaption,
                      ),

                    ],
                  ),

                  CommonButton(
                      height: 34,
                      width: 134,
                      borderRadius: 10,
                      text: "Pilih Sekarang",style: txtCaption.copyWith(color: blackColor),
                      onPressed: (){
                        // Get.toNamed(Routes.PILIH_POS_PAGE);
                      }
                  )
                ],
              ),
            ),

            // Image.asset(
            //   // imgSelectPos,
            //   // width: 150,
            // ),
          ],
        ),
      ),
    );
  }
}
