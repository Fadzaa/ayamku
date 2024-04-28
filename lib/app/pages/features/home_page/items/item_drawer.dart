import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    imgProfile,
                    width: 59,
                    height: 59,
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Alyaa Rana Raya",
                          style: txtHeadline3.copyWith(
                              color: blackColor
                          ),),

                        Text("alyaarana@gmail.com",
                          style: txtCaption.copyWith(
                              color: blackColor
                          ),),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            ListSidebar(
                text: "Notification",
                icon: icSidebarNotif,
                onPressed: (){}
            ),
            ListSidebar(
                text: "Keranjang",
                icon: icSidebarCart,
                onPressed: (){}
            ),
            ListSidebar(
                text: "Hubungi Admin",
                icon: icChat,
                onPressed: (){}
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
    );
  }
}

