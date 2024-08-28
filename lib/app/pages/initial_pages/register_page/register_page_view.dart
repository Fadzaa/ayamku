import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
        
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Daftar\nSekarang di ",
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
                    heading: "Nama",
                  ),
        
                  SizedBox(height: 20,),
        
                  CommonTextField(
                    controller: controller.emailController,
                    hintText: "Masukkan Alamat Email",
                    heading: "Email",
                  ),
        
                  SizedBox(height: 20,),

                  Obx(() {
                    return CommonTextField(
                      controller: controller.passwordController,
                      hintText: "Masukkan Password",
                      isObscure: !controller.isPasswordVisible.value,
                      heading: "Password",
                      onToggleObscure: () {
                        controller.togglePasswordVisibility();
                      },
                    );
                  }),
        
                  SizedBox(height: 30,),
        
                  CommonButton(text: "Daftar", onPressed: () => controller.otpVerification(), height: 50,),
                  
                  const SizedBox(height: 50,),
        
                  Row(
                    children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: blackColor
                          )
                        ),
                      SizedBox(width: 5,),
                        Text(" atau ", style: txtFormTitle.copyWith(color: blackColor30),),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Divider(
                            color: blackColor
                          ),
                        ),
                    ]
                  ),
        
                  SizedBox(height: 20,),
        
                  CommonButtonGoogle(text: "Register dengan Google"),
        
                  SizedBox(height: 20,),
        
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.LOGIN_PAGE);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Sudah punya akun? ",
                            style: txtFormTitle.copyWith(
                            ),
                          ),
                          TextSpan(
                            text: "Masuk sekarang",
                            style: txtFormTitle.copyWith(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]
              ),
            )
        ),
      )
    );
  }
}




