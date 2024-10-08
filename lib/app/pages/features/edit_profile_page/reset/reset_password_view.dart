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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() {
                  return CommonTextField(
                    controller: controller.currentPassword,
                    hintText: "Masukkan password lama",
                    isObscure: !controller.isPasswordVisibleCurrent.value,
                    heading: "Password anda",
                    onToggleObscure: () {
                      controller.togglePasswordVisibility(controller.isPasswordVisibleCurrent);
                    },
                  );
                }),

                SizedBox(height: 20,),

                Obx(() {
                  return CommonTextField(
                    controller: controller.newPassword,
                    hintText: "Masukkan password baru",
                    isObscure: !controller.isPasswordVisibleNew.value,
                    heading: "Password baru",
                    onToggleObscure: () {
                      controller.togglePasswordVisibility(controller.isPasswordVisibleNew);
                    },
                  );
                }),

                SizedBox(height: 30,),

                CommonButton(
                  text: "Ubah kata sandi",
                  onPressed: controller.validateForm,
                  height: 24,
                ),
              ],
            ),
          )
      ),
    );
  }
}


