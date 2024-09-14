import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  late AuthenticationService userService;
  late UserResponse userResponse;

  final user = Rx<Data>(Data());
  final token = RxString('');
  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    userService = AuthenticationService();
    getCurrentUser();
    fetchToken();
  }

  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  Future<void> getCurrentUser() async {
    try {
      isLoading.value = true;
      final response = await userService.showCurrentUser();

      print("CHECK CURRENT RESPONSE");
      print(response.data!);

      userResponse = UserResponse.fromJson(response.data);
      user.value = userResponse.data ?? Data();

      print(user.value);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await userService.logout();
      token.value = '';
      user.value = Data();
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
