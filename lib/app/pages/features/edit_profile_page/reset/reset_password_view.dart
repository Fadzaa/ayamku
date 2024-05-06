import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';

import '/../../../../common/theme.dart';
import 'reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
        appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        
        title: Row(
          children: [
           InkWell(
            onTap: () {
              Get.back();
              
            } ,
            child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
            ),
           ),

          //  ElevatedButton(onPressed: onPressed, child: child)

            SizedBox(width: 10,),

            Text(
              "Ganti Kata Sandi",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            )
          ],
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                CommonTextField(
                  controller: controller.currentPassword,
                  hintText: "Input password",
                  isObscure: true,
                  heading: "Current password",
                ),
                SizedBox(height: 10,),
                CommonTextField(
                  controller: controller.newPassword,
                  hintText: "New password",
                  isObscure: true,
                  heading: "New Password",
                ),
                SizedBox(height: 20,),
                CommonButton(text: "Confirm Password", onPressed: controller.validateForm,height: 24,),
            ],
          ),
          )
        ),
    );
  }
}


void testFunction    () {

}