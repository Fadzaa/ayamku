import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCompleteOrder extends StatelessWidget {
  const ItemCompleteOrder({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 16),
      decoration: BoxDecoration(
        color: greenSuccessOrder,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Text(
                  "Pesanan Selesai ",
                style: txtListItemTitle.copyWith(color: blackColor),
              ),

              SizedBox(height: 5,),

              Text(
                  "Terimakasih telah melakukan pemesanan!",
                style: txtCaption.copyWith(color: blackColor),
              )
              
            ],
          ),

          Image.asset(
            icCompletedOrder,
            width: 52,
          )
          
        ],
      ),
    );
  }
}
