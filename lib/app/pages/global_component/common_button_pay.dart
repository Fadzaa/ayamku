import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  String text, price;
  // Future<String> price;
  VoidCallback? onPressed;
  double? width;
  Color? color;
  Color? txtColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.125,
      padding: EdgeInsets.only(top: 15,bottom: 30,left: 16,right: 16),
      decoration: BoxDecoration(
        color: baseColor,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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

              Text(price,style: txtHarga.copyWith(color: blackColor),),

              // Obx((){
              //   return Text(
              //     price,
              //     style: txtHeadline1.copyWith(color: blackColor),
              //   );
              // }
              // )
              // FutureBuilder<String>(
              //   future: price,
              //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return commonLoading();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       return Text(
              //         snapshot.data!,
              //         style: txtHarga.copyWith(color: blackColor),
              //       );
              //     }
              //   },
              // ),
            ],
          ),

          Spacer(),

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
