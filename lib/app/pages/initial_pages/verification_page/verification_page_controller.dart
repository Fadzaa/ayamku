import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class VerificationPageController extends GetxController {
  TextEditingController otpNumberController = TextEditingController();
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;
  RxInt resendCountdown = 0.obs;
  Timer? countdownTimer;
  int? receivedOtp;

  @override
  void onInit() {
    super.onInit();
    otpNumberController = TextEditingController();
    authenticationService = AuthenticationService();
    receivedOtp = Get.arguments['otp'];
    print("PASSED OTP VALUE IS");
    print(receivedOtp);
  }

  Future<void> otpVerification() async {
    try {
      isLoading(true);
      final response = await authenticationService.otpVerification(Get.arguments['email']);
      receivedOtp = response.data['otp'];
      Get.snackbar('Success', 'OTP has been sent to your email');
      startResendCountdown();
      print("object");
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);
      final enteredOtp = int.tryParse(otpNumberController.text);

      if (enteredOtp != null && enteredOtp == receivedOtp) {
        final response = await authenticationService.register(
          Get.arguments['name'],
          Get.arguments['email'],
          Get.arguments['password'],
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data['token']);

        Get.snackbar("Register Success", "Your Account Registered Successfully");
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.snackbar('Error', 'Invalid OTP');
      }
    } catch (e) {
      Get.snackbar("Register Failed", "Network Error: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  void startResendCountdown() {
    resendCountdown.value = 180;
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }
}
