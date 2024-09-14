import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../router/app_pages.dart';

class ResetController extends GetxController {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();


  RxBool isPasswordVisibleCurrent = false.obs;
  RxBool isPasswordVisibleNew = false.obs;
  RxBool isLoading = false.obs;

  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();
    authenticationService = AuthenticationService();
  }



  void validateForm() {
    if (currentPassword.text.isNotEmpty && newPassword.text.isNotEmpty) {
      updatePassword(currentPassword.text, newPassword.text);
    } else {
      Get.snackbar("Validation Error", "Please fill in all the fields");
    }
  }

  void togglePasswordVisibility(RxBool isVisible) {
    isVisible.value = !isVisible.value;
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      isLoading(true);

      await authenticationService.updatePassword(
        oldPassword,
        newPassword,
      );

      Get.snackbar(
        "Sukses",
        "Password berhasil diubah",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );

      Get.offNamed(Routes.HOME_PAGE, arguments: 2);

    } catch (e) {

      Get.snackbar(
        "Update Error",
        "Silahkan cek password lama anda",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
    } finally {
      isLoading(false);
    }
  }



}