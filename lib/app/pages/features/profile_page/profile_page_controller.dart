import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePageController extends GetxController {

  late AuthenticationService userService;
  late UserResponse userResponse;
  Data currentUser = Data();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    userService = AuthenticationService();
    getCurrentUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> getCurrentUser() async {
    try {
      isLoading(true);
      final response = await userService.showCurrentUser();

      print("CHECK CURRENT RESPONSE");
      print(response.data!);
      print(listUser);

      userResponse = UserResponse.fromJson(response.data);
      listUser = userResponse.data;

      print(listUser);


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