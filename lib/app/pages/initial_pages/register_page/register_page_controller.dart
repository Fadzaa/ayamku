import 'package:ayamku_delivery/app/api/auth/model/user_list_response.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth/authetication_service.dart';
import '../../../router/app_pages.dart';


class RegisterPageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString username = ''.obs;
  RxBool emailExists = false.obs;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  late AuthenticationService authenticationService;
  Rx<UserListResponse> userListResponse = UserListResponse().obs;

  //validator error
  RxString nameError = ''.obs;
  RxString emailError = ''.obs;
  RxString passError = ''.obs;

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

  // Future<void> otpVerification() async {
  //
  //   try {
  //     isLoading(true);
  //     final response = await authenticationService.otpVerification(emailController.text);
  //
  //
  //     Get.snackbar('Success', 'OTP has been sent to your email');
  //
  //     Get.toNamed(Routes.VERIFICATION_PAGE, arguments: {
  //       'name': nameController.text,
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //       'otp': response.data['otp']
  //     });
  //
  //
  //   } catch (e) {
  //     isLoading(true);
  //     Get.snackbar('Register Error', 'Network Error');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<bool> checkEmailExists() async {
    userListResponse.value = await authenticationService.getAllUser();
    emailExists.value = userListResponse.value.data?.any((user) => user.email == emailController.text) ?? false;
    return emailExists.value;
  }

  Future<void> otpVerification() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      bool emailExists = await checkEmailExists();

      if (emailExists) {
        Get.snackbar(
          "Email anda sudah terdaftar",
          "Silahkan lakukan login ulang untuk masuk ke akun anda",
          backgroundColor: redAlert,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          borderRadius: 30,
          margin: EdgeInsets.all(10),
        );
      } else {
        final response = await authenticationService.otpVerification(emailController.text);

        Get.snackbar('Success', 'OTP has been sent to your email');

        Get.toNamed(Routes.VERIFICATION_PAGE, arguments: {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'otp': response.data['otp']
        });
      }
    } catch (e) {
      Get.snackbar('Register Error', 'Network Error');
    } finally {
      isLoading(false);
    }
  }






}