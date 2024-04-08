import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
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
        title: Text("Ganti Kata Sandi"),
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
                CommonTextField(
                  controller: controller.confirmPassword,
                  hintText: "Confirm new password",
                  isObscure: true,
                  heading: "Confirm new Password",
                ),
                SizedBox(height: 20,),
                CommonButton(text: "Login", onPressed: controller.validateForm),
            ],
          ),
          )
        ),
    );
  }
}