import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionLast extends StatelessWidget {
  const SectionLast({
    super.key,
    required this.sendReview,
    required this.txt
  });

  final VoidCallback sendReview;
  final String txt;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 15, left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ContainerLastSection(
            onPressed: ()async{
              final url = 'https://wa.me/6281328206080';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }

            },
            icon: icHubungiAdmin,
            text: 'Chat admin',),

          SizedBox(width: 10,),

          InkWell(
            onTap: sendReview,
            child: ContainerLastSection(
              icon: icStarOutline,
              text: txt,
            ),
          )
        ],
      ),
    );
  }
}

class ContainerLastSection extends StatelessWidget {
  const ContainerLastSection({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed
  });

  final String icon, text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blackColor50)
        ),
        child: Row(
          children: [

            SvgPicture.asset(
              icon,
              width: 24,
            ),

            SizedBox(width: 8,),

            Text(
              text,
              style: txtButtonTab.copyWith(color: blackColor),
            )

          ],
        ),
      ),
    );
  }
}

