import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../router/app_pages.dart';
import 'items/item_profile_vertical.dart';
import 'model/profile_data.dart';

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
                Row(
                  children: [
                    Image.asset(
                      imgProfile,
                      width: 70,
                      height: 70,
                    ),

                    SizedBox(width: 15,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alyaa Rana Raya",
                          style: txtHeadline3.copyWith(
                              color: blackColor
                          ),),
                        Text("alyaarana@gmail.com",
                          style: txtCaption.copyWith(
                              color: blackColor
                          ),),
                        Text("+62 87654 890",
                          style: txtCaption.copyWith(
                              color: blackColor
                          ),),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 60,),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list_profile.length,
                    itemBuilder: (context, index) =>
                        ItemProfileVertical(
                            icon: list_profile[index].icon,
                            name: list_profile[index].name,
                            routes: list_profile[index].routes?? "",
                            // isDarkMode: list_profile[index].isDarkMode
                        )
                ),

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