import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePageController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late AuthenticationService userService;
  late UserResponse userResponse;
  Data user = Data();
  RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();
  String imageUrl = 'https://i.imgflip.com/6yvpkj.jpg';

  @override
  void onInit() {
    super.onInit();

    userService = AuthenticationService();
    getCurrentUser();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageUrl = image.path;
      update();
    } else {
      print('No image selected.');
    }
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
      imageUrl = user.profilePicture!;



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
      final response = await userService.updateUser(
          namaController.text,
          emailController.text,
          phoneController.text,
          imageUrl
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

    } catch (e) {
      Get.snackbar("Update failed", "Failed to update profile: $e");
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }
}
