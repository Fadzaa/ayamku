import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/auth/authetication_service.dart';
import '../../../router/app_pages.dart';


class RegisterPageController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  RxString username = ''.obs;
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();
  }

  Future<void> register() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await authenticationService.register(
          nameController.text,
          emailController.text,
          passwordController.text,
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

  // void validateForm() {
  //   if (nameController.text.isEmpty) {
  //     Get.snackbar('Error', 'Name is required');
  //   } else if (emailController.text.isEmpty) {
  //     Get.snackbar('Error', 'Email is required');
  //   } else if (passwordController.text.isEmpty) {
  //     Get.snackbar('Error', 'Password is required');
  //   } else if (confirmPassController.text.isEmpty) {
  //     Get.snackbar('Error', 'Confirm Password is required');
  //   } else if (passwordController.text != confirmPassController.text) {
  //     Get.snackbar('Error', 'Password does not match');
  //   } else {
  //     Get.snackbar('Success', 'Form is valid');
  //     Get.toNamed(Routes.HOME_PAGE);
  //   }
  // }


}