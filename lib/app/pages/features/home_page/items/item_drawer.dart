import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../api/auth/model/userResponse.dart';

class ItemDrawer extends GetView<HomePageController> {
  ItemDrawer({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: baseColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            DrawerHeader(
                child: InkWell(
                  onTap: (){
                    Get.offAllNamed(Routes.HOME_PAGE, arguments: 3);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.user.name.toString(),
                              style: txtHeadline3.copyWith(
                                  color: blackColor
                              ),),

                            Text(controller.user.email.toString(),
                              style: txtCaption.copyWith(
                                  color: blackColor
                              ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
            ),

            ListSidebar(
                text: "Notification",
                icon: icSidebarNotif,
                onPressed: (){
                  final token = controller.token;
                  if (token != null) {
                    Get.toNamed(Routes.NOTIFICATION_PAGE);
                  } else {
                    Get.toNamed(Routes.LOGIN_PAGE);
                  }

                }
            ),
            ListSidebar(
                text: "Keranjang",
                icon: icSidebarCart,
                onPressed: (){
                  final token = controller.token;
                  if (token != null) {
                    Get.toNamed(Routes.CART_PAGE);
                  } else {
                    Get.toNamed(Routes.LOGIN_PAGE);
                  }
                }
            ),
            ListSidebar(
                text: "Hubungi Admin",
                icon: icChat,
                onPressed: (){

                }
            ),
          ],
        ),
      ),
    );
  }
}

class ListSidebar extends StatelessWidget {
  ListSidebar({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  String text;
  String icon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [

              SvgPicture.asset(
                icon,
                width: 26,
                height: 26,
              ),

              SizedBox(width: 15,),

              Text(
                  text,
                  style: txtFormTitle.copyWith(color: blackColor,)
              )
            ],
          ),
        ),
      ),
    );
  }
}