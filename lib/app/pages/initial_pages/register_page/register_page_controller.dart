import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth/authetication_service.dart';
import '../../../router/app_pages.dart';


class RegisterPageController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString username = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> otpVerification() async {

    try {
      isLoading(true);
      final response = await authenticationService.otpVerification(emailController.text);


      Get.snackbar('Success', 'OTP has been sent to your email');

      Get.toNamed(Routes.VERIFICATION_PAGE, arguments: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'otp': response.data['otp']
      });


    } catch (e) {
      isLoading(true);
      Get.snackbar('Register Error', 'Network Error');
    } finally {
      isLoading(false);
    }
  }





}