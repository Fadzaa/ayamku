import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/loading_overlay.dart';
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
        body: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            body: SingleChildScrollView(
                child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "Daftar\nSekarang di ",
                                    style: txtHeadline1),
                                TextSpan(
                                  text: "AyamKu",
                                  style: txtHeadline1.copyWith(
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          CommonTextField(
                            controller: controller.nameController,
                            hintText: "Masukkan Nama",
                            heading: "Nama",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.nameError.value = 'Masukkan nama';
                                return controller.nameError.value;
                              }
                              controller.nameError.value = '';
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          CommonTextField(
                            controller: controller.emailController,
                            hintText: "Masukkan Email",
                            heading: "Email",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                controller.emailError.value =
                                    'Silahkan masukkan email';
                                return controller.emailError.value;
                              }
                              controller.emailError.value = '';
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Obx(() {
                            return CommonTextField(
                              controller: controller.passwordController,
                              hintText: "Masukkan Password",
                              isObscure: !controller.isPasswordVisible.value,
                              heading: "Password",
                              onToggleObscure: () {
                                controller.togglePasswordVisibility();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  controller.passError.value =
                                      'Silahkan masukkan password';
                                  return controller.passError.value;
                                }
                                controller.passError.value = '';
                                return null;
                              },
                            );
                          }),

                          SizedBox(
                            height: 30,
                          ),

                          CommonButton(
                            text: "Daftar",
                            onPressed: () => controller.otpVerification(),
                            height: 50,
                          ),

                          const SizedBox(
                            height: 50,
                          ),

                          // Row(children: <Widget>[
                          //   Expanded(child: Divider(color: blackColor)),
                          //   SizedBox(
                          //     width: 5,
                          //   ),
                          //   Text(
                          //     " atau ",
                          //     style: txtFormTitle.copyWith(color: blackColor30),
                          //   ),
                          //   SizedBox(
                          //     width: 5,
                          //   ),
                          //   Expanded(
                          //     child: Divider(color: blackColor),
                          //   ),
                          // ]),
                          //
                          // // SizedBox(height: 20,),
                          // //
                          // // CommonButtonGoogle(text: "Register dengan Google"),
                          //
                          // SizedBox(
                          //   height: 20,
                          // ),

                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN_PAGE);
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Sudah punya akun? ",
                                    style: txtFormTitle.copyWith(),
                                  ),
                                  TextSpan(
                                    text: "Login sekarang",
                                    style: txtFormTitle.copyWith(
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                  )),
            )))));
  }
}
