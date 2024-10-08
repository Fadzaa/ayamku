import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth/authetication_service.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  late AuthenticationService authenticationService;

  //validator error
  RxString emailError = ''.obs;
  RxString passError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();

  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      final fcmToken = await FirebaseMessaging.instance.getToken();

      final response = await authenticationService.login(
          emailController.text,
          passwordController.text,
          fcmToken!
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar(
        "Login sukses",
        "Selamat datang",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(true);
      if (e is dio.DioError) {
        print(e.response!.data);
        Get.snackbar("Error", e.response!.data['message']);
      } else {
        Get.snackbar(
          "Login gagal",
          "Silahkan periksa email atau password anda!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: EdgeInsets.all(10),
        );
      }

    } finally {
      isLoading(false);
    }
  }



  void validateForm() {
    Get.toNamed(Routes.HOME_PAGE);
  }


}