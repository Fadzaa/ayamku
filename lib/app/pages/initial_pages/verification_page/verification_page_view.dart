import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/initial_pages/verification_page/verification_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPageView extends GetView<VerificationPageController> {
  const VerificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),

              Text(
                'Verifikasi kode',
                style: txtHeadline1,
              ),

              SizedBox(height: 5,),

              RichText(
                text: TextSpan(
                    text: "We have sent u code to",
                    style: txtBody,
                    children: [
                      TextSpan(
                          text: " alyaaranaraya@gmail.com",
                          style: txtBody.copyWith(color: primaryColor)
                      )]),
              ),

              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    print(value);
                  },
                  textStyle: txtFormTitle.copyWith(color: blackColor),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 44,
                    fieldWidth: 44,
                    activeColor: primaryColor,
                    inactiveColor: blackColor50,
                    selectedColor: primaryColor,
                    borderWidth: 1
                  )
                ),
              ),

              SizedBox(height: 50,),

              CommonButton(
                height: 56,
                  text: "Verifikasi",
                  onPressed: (){}
              ),

              SizedBox(height: 15,),

              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Belum mendapatkan kode? ",
                      style: txtBody,
                      children: [
                        TextSpan(
                            text: " Kirim ulang",
                            style: txtBody.copyWith(color: primaryColor)
                        )]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
