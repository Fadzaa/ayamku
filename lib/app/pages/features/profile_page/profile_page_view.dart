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
                HeaderProfile(currentUser: controller.listUser,),

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

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
    required this.currentUser
  });

  final List<CurrentUser> currentUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentUser.length,
        itemBuilder: (context, index){
          final user = currentUser[index];

          return Row(
            children: [
              Image.asset(
                user.profilePicture,
                width: 70,
                height: 70,
              ),

              SizedBox(width: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                    style: txtHeadline3.copyWith(
                        color: blackColor
                    ),),
                  Text(user.email,
                    style: txtCaption.copyWith(
                        color: blackColor
                    ),),
                  Text(user.phoneNumber,
                    style: txtCaption.copyWith(
                        color: blackColor
                    ),),
                ],
              )
            ],
          );
        }
    );
  }
}
