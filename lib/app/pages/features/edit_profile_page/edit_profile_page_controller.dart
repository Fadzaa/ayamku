import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/bottom_navigation.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../profile_page/profile_page_controller.dart';

class EditProfilePageController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late AuthenticationService userService;
  late UserResponse userResponse;
  Data user = Data();
  RxBool isLoading = false.obs;

  String imageUrl = 'https://i.imgflip.com/6yvpkj.jpg'; // Ganti dengan URL default gambar profil

  RxString selectedImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userService = AuthenticationService();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      isLoading(true);
      final response = await userService.showCurrentUser();

      print("Response from showCurrentUser:");
      print(response.data);

      if (response.data != null) {
        userResponse = UserResponse.fromJson(response.data);
        user = userResponse.data!;

        namaController.text = user.name ?? '';
        emailController.text = user.email ?? '';
        phoneController.text = user.phoneNumber ?? '';
        selectedImagePath.value = user.profilePicture ?? imageUrl;
      } else {
        // Handle the case where response.data is null
        print("Response data is null");
      }

    } catch (e) {
      print("Error in getCurrentUser: $e");
      Get.snackbar("Error", "Failed to fetch user data: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> pickImage(RxString selectedImagePath) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      print('No image selected.');
    }
  }

  Future<void> updateUser() async {
    try {
      isLoading(true);

      // dio.FormData formData = dio.FormData.fromMap({
      //   'name': namaController.text,
      //   'email': emailController.text,
      //   'phone_number': phoneController.text?? '',
      //   if (selectedImagePath.value.isNotEmpty)
      //     'profile_picture': await dio.MultipartFile.fromFile(selectedImagePath.value),
      // });

      final response = await userService.updateUser(
        namaController.text,
        emailController.text,
        phoneController.text,
        selectedImagePath.value,
      );

      if (response.data != null) {
        userResponse = UserResponse.fromJson(response.data);
        user = userResponse.data!;

        namaController.text = user.name ?? '';
        emailController.text = user.email ?? '';
        phoneController.text = user.phoneNumber ?? '';
        selectedImagePath.value = user.profilePicture ?? imageUrl;
      }

      Get.snackbar("Update Profile Success", "Profile has been updated");
      

    } catch (e) {
      Get.snackbar("Update Failed", "Failed to update profile: $e");
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }
}
