import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePageController extends GetxController {
  TextEditingController namaController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
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
    // emailController.text = arguments.email ?? '';
    selectedImagePath.value = arguments.profilePicture ?? 'https://i.imgflip.com/6yvpkj.jpg';
    phoneController.text = arguments.phoneNumber ?? '';
  }

  // Future<void> getCurrentUser() async {
  //   try {
  //     isLoading(true);
  //     final response = await userService.showCurrentUser();
  //
  //     print("Response from showCurrentUser:");
  //     print(response.data);
  //
  //     if (response.data != null) {
  //       userResponse = UserResponse.fromJson(response.data);
  //       user = userResponse.data!;
  //
  //       namaController.text = user.name ?? '';
  //       emailController.text = user.email ?? '';
  //       phoneController.text = user.phoneNumber ?? '';
  //       selectedImagePath.value = user.profilePicture ?? imageUrl;
  //     } else {
  //       // Handle the case where response.data is null
  //       print("Response data is null");
  //     }
  //
  //   } catch (e) {
  //     print("Error in getCurrentUser: $e");
  //     Get.snackbar("Error", "Failed to fetch user data: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

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
        'phone_number': "0979879768",
      };

      if (!selectedImagePath.value.contains("https")) {
        data["profile_picture"] = await dio.MultipartFile.fromFile(selectedImagePath.value);
      }

      dio.FormData formData = dio.FormData.fromMap(data);

      await userService.updateUser(formData);

      Get.snackbar("Update Profile Success", "Profile has been updated");

      // Get.offNamedUntil(Routes.HOME_PAGE, arguments: 2, (routes) => routes.settings.name == Routes.HOME_PAGE);
      Get.offAllNamed(Routes.HOME_PAGE, arguments: 2);

    } catch (e) {
      Get.snackbar("Update Failed", "Failed to update profile: $e");
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }

}
