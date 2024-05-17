import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/items/item_textfield_phone.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/theme.dart';
import '../../global_component/common_button.dart';


class EditProfilePageView extends GetView<EditProfilePageController>{
  const EditProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            
            InkWell(
              onTap: (){
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 40,),
          
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                ))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              icCamera,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 20,),
                
                CommonTextField(heading: "Nama", controller: controller.namaController, hintText: "AlyaaRana"),
          
                SizedBox(height: 20,),
          
                CommonTextField(heading: "Alamat Email", controller: controller.emailController, hintText: "alyaarana@gmail.com"),
          
                SizedBox(height: 20,),
          
                ItemTextFieldPhone(heading: "No. Handphone", controller: controller.phoneController, hintText: '0000 - 0000 - 0000',),
          
                SizedBox(height: 100,),
          
                CommonButton(text: 'Save', onPressed: () {  },height: 56,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}