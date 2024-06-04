import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePageController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late AuthenticationService userService;
  late UserResponse userResponse;
  Data user = Data();
  RxBool isLoading = false.obs;

  String imageUrl = 'https://i.imgflip.com/6yvpkj.jpg';

  RxString selectedImagePath = ''.obs;

  Future<void> pickImage(RxString selectedImagePath) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
      print(selectedImagePath.value);
      print("Image Selected");
    } else {
      print('No image selected.');
    }
  }

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

      print("CHECK CURRENT RESPONSE");
      print(response.data!);
      print(user);

      userResponse = UserResponse.fromJson(response.data);
      user = userResponse.data!;

      print(user);

      namaController.text = user.name!;
      emailController.text = user.email!;
      phoneController.text = user.phoneNumber!;
      selectedImagePath.value = user.profilePicture ?? imageUrl;

    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateUser() async {
    try {
      isLoading(true);

      dio.FormData formData = dio.FormData.fromMap({
        'name': namaController.text,
        'email': emailController.text,
        'phone_number': phoneController.text,
        'profile_picture': await dio.MultipartFile.fromFile(selectedImagePath.value),
      });

      await userService.updateUser(
          formData
      );

      Get.snackbar("Update profile Success", "Profile has been updated");
      Get.toNamed(Routes.PROFILE_PAGE);


    } catch (e) {
      Get.snackbar("Update failed", "Failed to update profile: $e");
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }
}
