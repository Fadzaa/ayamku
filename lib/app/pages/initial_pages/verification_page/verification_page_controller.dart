import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPageController extends GetxController{

  TextEditingController otpNumberController = TextEditingController();
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();
    otpNumberController = TextEditingController();
    authenticationService = AuthenticationService();
    otpVerification();
    register();
  }

  Future<void> otpVerification() async {
    try {
      isLoading(true);

      await authenticationService.otpVerification(
          Get.arguments['email']
      );

      Get.snackbar('Success', 'OTP has been sent to your email');
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(true);
      Get.snackbar('Register Error', 'Network Error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await authenticationService.register(
          Get.arguments['name'],
          Get.arguments['email'],
          Get.arguments['password'],
          otpNumberController.value.text
      );

      prefs.setString('token', response.data['token']);

      Get.snackbar("Register Success", "Your Account Registered Successfully");
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(false);
      Get.snackbar("Register Failed", "Network Error" + e.toString());
    }finally {
      isLoading(false);
    }
  }

}