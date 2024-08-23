import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            Text(
                              (controller.user != null && controller.user.name != null) ? controller.user.name.toString() : "Guest",
                              style: txtHeadline3.copyWith(
                                  color: blackColor
                              ),
                            ),
                            Text(
                              (controller.user != null && controller.user.email != null) ? controller.user.email.toString() : "",
                              style: txtCaption.copyWith(
                                  color: blackColor
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
            ),

            ListSidebar(
                text: "Notifikasi",
                icon: icSidebarNotif,
                onPressed: (){
                  if (controller.token.value.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonAlert(
                          image: guest,
                            title: 'Kamu sedang dalam mode tamu',
                            content: "Silahkan login untuk melanjutkan",
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () async {
                              Get.back();
                              Get.offAllNamed(Routes.LOGIN_PAGE);
                            },
                          confirmText: 'Login Sekarang',
                          cancelText: 'Lanjutkan tamu mode',
                        );
                      },
                    );
                  } else {
                    Get.toNamed(Routes.NOTIFICATION_PAGE);
                  }
                }
            ),
            ListSidebar(
                text: "Keranjang",
                icon: icSidebarCart,
                onPressed: (){
                  if (controller.token.value.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonAlert(
                          image: guest,
                          title: 'Kamu sedang dalam mode guest',
                          content: "Silahkan login untuk melanjutkan",
                          onCancel: () {
                            Get.back();
                          },
                          onConfirm: () async {
                            Get.back();
                            Get.offAllNamed(Routes.LOGIN_PAGE);
                          },
                          confirmText: 'Login Sekarang',
                          cancelText: 'Lanjutkan guest mode',
                        );
                      },
                    );
                  } else {
                    Get.toNamed(Routes.CART_PAGE);
                  }
                }
            ),
            ListSidebar(
                text: "Hubungi Admin",
                icon: icChat,
                onPressed: ()async{
                  final url = 'https://wa.me/6285236054530';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }

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