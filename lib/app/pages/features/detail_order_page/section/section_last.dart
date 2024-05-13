import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionLast extends StatelessWidget {
  const SectionLast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            child: ContainerLastSection(
              icon: icHubungiAdmin,
              text: 'Chat admin',),
          ),

          SizedBox(width: 10,),

          Expanded(
            child: ContainerLastSection(
              icon: icStarOutline,
              text: 'Lihat penilaian',
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
    required this.text
  });

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
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
    );
  }
}

