import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/items/item_textfield_phone.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/bottom_navigation.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import '../../global_component/common_button.dart';
import 'items/item_pick_img.dart';


class EditProfilePageView extends GetView<EditProfilePageController>{
  EditProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  icBack,
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                "Edit Profile",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              )
            ],
          )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Obx(() => ItemPickImg(
                  onTap: () {
                    controller.pickImage(controller.selectedImagePath);
                  },
                  image: controller.selectedImagePath.value.isNotEmpty
                      ? controller.selectedImagePath.value
                      : controller.imageUrl
                )),

                SizedBox(height: 20,),
        
                CommonTextField(heading: "Nama", controller: controller.namaController, hintText: "name"),
        
                SizedBox(height: 20,),
        
                CommonTextField(heading: "Alamat Email", controller: controller.emailController, hintText: "email"),
        
                SizedBox(height: 20,),
        
                ItemTextFieldPhone(heading: "No. Handphone", controller: controller.phoneController, hintText: "phoneNumber"),
        
                SizedBox(height: 100,),
        
                CommonButton(text: 'Save', onPressed: () {
                  controller.updateUser();
                  BottomNavigation.navKey.currentState!.setSelectedIndex(3);
                }, height: 56)
              ],
            )
          ),
            ),
      ),);
  }
}
