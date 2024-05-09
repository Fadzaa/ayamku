import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();


  @override
  void onInit() {
    super.onInit();


  }



  void validateForm() {
    Get.toNamed(Routes.HOME_PAGE);
  }


}