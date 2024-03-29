
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import 'register_page_controller.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Selamat\nDatang di ",
                        style: txtHeadline1
                      ),
                      TextSpan(
                        text: "AyamKu",
                        style: txtHeadline1.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                CommonTextField(
                  controller: controller.nameController,
                  hintText: "Masukkan Nama",
                ),
                CommonTextField(
                  controller: controller.emailController,
                  hintText: "Masukkan Alamat Email",
                ),
                CommonTextField(
                  controller: controller.passwordController,
                  hintText: "Masukkan Password",
                  isObscure: true,
                ),
                SizedBox(height: 20,),
                CommonButton(text: "Register", onPressed: controller.validateForm),
                const SizedBox(height: 50,),
                Row(
                  children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: blackColor
                        )
                      ),       
                      Text(" OR "),        
                      Expanded(
                        child: Divider(
                          color: blackColor
                        ),
                      ),
                  ]
                ),
                SizedBox(height: 20,),
                CommonButtonGoogle(
                  
                ),
                SizedBox(height: 20,),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have account? ",
                        style: txtFormTitle.copyWith(
                        ),
                      ),
                      TextSpan(
                        text: "Login now",
                        style: txtFormTitle.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ]
            ),
          )
      )
    );
  }
}




