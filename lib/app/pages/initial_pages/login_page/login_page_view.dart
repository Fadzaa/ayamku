import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/loading_overlay.dart';
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
      body: Obx(() => LoadingOverlay(
          isLoading: controller.isLoading.value,
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
                          controller: controller.emailController,
                          hintText: "Masukkan Email",
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
                        CommonButton(text: "Login", onPressed: ()=> controller.login(), height: 50,),
                        SizedBox(height: 50,),
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider(
                                      color: blackColor
                                  )
                              ),
                              Text(" or ", style: txtFormTitle.copyWith(color: blackColor30),),
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

                        InkWell(
                          onTap: (){
                            Get.toNamed(Routes.REGISTER_PAGE);
                          },
                          child: Text.rich(
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
                        ),
                      ]
                  ),
                )
            ),
          )
      ))
    );
  }
}




