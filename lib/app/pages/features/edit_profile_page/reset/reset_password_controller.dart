import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ResetController extends GetxController {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();


    authenticationService = AuthenticationService();
    updatePassword();
  }



  void validateForm() {
    if (currentPassword.text.isNotEmpty && newPassword.text.isNotEmpty) {
      updatePassword();
    } else {
      Get.snackbar("Validation Error", "Please fill in all the fields");
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> updatePassword() async {
    try {
      isLoading(true);
      dio.FormData formData = dio.FormData.fromMap({
        'old_password': currentPassword.text,
        'new_password': newPassword.text,
      });
      await authenticationService.updatePassword(
          formData
      );
      Get.snackbar("Update password Success", "Password has been updated");

    } catch (e) {
      isLoading(true);
      Get.snackbar("Update Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }


}