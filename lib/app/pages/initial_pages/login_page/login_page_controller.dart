import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth/authetication_service.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();

  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          emailController.text,
          passwordController.text
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid email or password");
      print(e);

    } finally {
      isLoading(false);
    }
  }



  void validateForm() {
    Get.toNamed(Routes.HOME_PAGE);
  }


}