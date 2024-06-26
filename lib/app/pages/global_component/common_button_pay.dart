import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class CommonButtonPay extends StatelessWidget {
  CommonButtonPay({
    super.key,
    required this.text,
    required this.price,
    this.onPressed,
    this.width,
    this.color,
    this.txtColor,
  });

  String text,price;
  VoidCallback? onPressed;
  double? width;
  Color? color;
  Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 30,left: 16,right: 16),
      decoration: BoxDecoration(
        color: baseColor,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Total Bayar",
                style: txtHeadline3.copyWith(color: Colors.grey),
              ),

              SizedBox(height: 5,),

              Text(
                price,
                style: txtHarga.copyWith(color: blackColor),
              ),
            ],
          ),

          CommonButton(
            txtColor: txtColor?? blackColor,
            color: color?? primaryColor,
              width: width,
              text: text,
              onPressed: onPressed
          )

        ],
      ),
    );
  }
}
