import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:flutter/cupertino.dart';
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
      updatePassword();
    } else {
      Get.snackbar("Validation Error", "Please fill in all the fields");
    }
  }

  void togglePasswordVisibility(RxBool isVisible) {
    isVisible.value = !isVisible.value;
  }

  Future<void> updatePassword() async {
    try {
      isLoading(true);

      dio.FormData formData = dio.FormData.fromMap({
        'old_password': currentPassword.text.toString(),
        'new_password': newPassword.text.toString(),
      });

      await authenticationService.updatePassword(formData);

      Get.snackbar("Update password Success", "Password has been updated");

      Get.offAllNamed(Routes.HOME_PAGE, arguments: 2);

    } catch (e) {
      isLoading(true);
      Get.snackbar("Update Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }


}