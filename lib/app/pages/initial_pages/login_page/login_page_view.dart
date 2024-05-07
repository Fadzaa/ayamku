import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';

import '../../../../common/theme.dart';
import 'login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

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
                        style: txtHeadline1.copyWith(
                        ),
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
                  heading: "Nama",
                ),
                SizedBox(height: 10,),
                CommonTextField(
                  controller: controller.passwordController,
                  hintText: "Masukkan Password",
                  isObscure: true,
                  heading: "Password",
                  
                ),
                SizedBox(height: 20,),
                CommonButton(text: "Login", onPressed: controller.validateForm),
                SizedBox(height: 50,),
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
                  text: "Login dengan Google",
                ),
                SizedBox(height: 20,),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have account? ",
                        style: txtFormTitle.copyWith(
                        ),
                      ),
                      TextSpan(
                        text: "Register now",
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




