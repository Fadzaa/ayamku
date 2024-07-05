import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: baseColor
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(successPay),

              const SizedBox(height: 20),

              Text(
                'Payment successful ! ',
                style: txtButtonTab.copyWith(
                    color: primaryColor
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'Your payment was made successfully',
                style: txtButtonTab.copyWith(
                    color: blackColor
                ),
              ),

              const SizedBox(height: 35),

              CommonButton(
                width: 220,
                  text: "Lihat pesanan kamu",
                  onPressed: (){
                    Get.offAllNamed(Routes.HOME_PAGE, arguments: 1);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
