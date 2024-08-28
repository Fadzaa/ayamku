import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
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

  final Data arguments = Get.arguments;


  final ImagePicker _picker = ImagePicker();
  RxString selectedImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userService = AuthenticationService();
    namaController.text = arguments.name ?? '';
    emailController.text = arguments.email ?? '';
    selectedImagePath.value = arguments.profilePicture ?? 'https://i.imgflip.com/6yvpkj.jpg';
    phoneController.text = arguments.phoneNumber ?? '';
  }


  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImagePath.value = pickedFile.path;
    }
  }


  Future<void> updateUser() async {
    try {
      isLoading(true);

      Map<String, dynamic> data = {
        "name" : namaController.text,
        // 'email': emailController.text,
        // 'phone_number': "0979879768",
      };

      if (!selectedImagePath.value.contains("https")) {
        data["profile_picture"] = await dio.MultipartFile.fromFile(selectedImagePath.value);
      }

      dio.FormData formData = dio.FormData.fromMap(data);

      await userService.updateUser(formData);

      Get.snackbar(
        "Sukses",
        "Profil berhasil diupdate",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
      Get.toNamed(Routes.HOME_PAGE,arguments: 2);
    } catch (e) {
      Get.snackbar("Update Failed", "Failed to update profile: $e");
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }

}
