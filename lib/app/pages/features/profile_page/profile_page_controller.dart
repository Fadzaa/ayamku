import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePageController extends GetxController {

  late AuthenticationService userService;
  late UserResponse userResponse;
  Data user = Data();
  String? token;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    userService = AuthenticationService();
    getCurrentUser();
    fetchToken();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<void> getCurrentUser() async {
    try {
      isLoading(true);
      final response = await userService.showCurrentUser();

      print("CHECK CURRENT RESPONSE");
      print(response.data!);
      print(user);

      userResponse = UserResponse.fromJson(response.data);
      user = userResponse.data!;

      print(user);


    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      isLoading(true);
      await userService.logout();
      Get.offAllNamed('/login-page');
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }


}