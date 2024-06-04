import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/items/item_profile_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/auth/model/userResponse.dart';
import '../../../router/app_pages.dart';


class ProfilePageView extends GetView<ProfilePageController>{
  const ProfilePageView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: txtTitlePage.copyWith(
              color: blackColor
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderProfile(),

                SizedBox(height: 60,),

                ItemProfileVertical(),

                SizedBox(height: 40,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN_PAGE),
                      icon: Icon(Icons.logout, color: errorColor),
                    ),
                    const SizedBox(width: 5),
                    Text("Logout",style: txtFormTitle.copyWith(color: errorColor),)
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}

class HeaderProfile extends GetView<HomePageController> {
  const HeaderProfile({
    Key? key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            controller.user.profilePicture != null
                ? controller.user.profilePicture.toString()
                : 'https://i.imgflip.com/6yvpkj.jpg',
          ),
        ),

        SizedBox(width: 15,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.user.name ?? '',
              style: txtHeadline3.copyWith(
                  color: blackColor
              ),),
            Text(controller.user.email ?? '',
              style: txtCaption.copyWith(
                  color: blackColor
              ),),
            Text(controller.user.phoneNumber ?? '',
              style: txtCaption.copyWith(
                  color: blackColor
              ),),
          ],
        )
      ],
    );
  }
}
