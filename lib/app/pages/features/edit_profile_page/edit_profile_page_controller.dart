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
  late User userResponse;
  List<CurrentUser> listUser = <CurrentUser>[];
  RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();
  String imageUrl = 'https://i.imgflip.com/6yvpkj.jpg';




  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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

      Get.snackbar("Update berhasil", "Profile anda berhasil di update");

    } catch (e) {
      isLoading(true);
      Get.snackbar("Update gagal", "Profile anda gagal di update");
      print(e);
  }


 }
}