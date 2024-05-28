import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/common/theme.dart';

class ItemProfileVertical extends StatelessWidget {
  const ItemProfileVertical({
    Key? key,
    required this.icon,
    required this.name,
    required this.routes,
    this.isDarkMode,
  }) : super(key: key);

  final String icon, name, routes;
  final bool? isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5,top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(icon, width: 24, height: 24),

                const SizedBox(width: 15),

                Text(
                  name,
                  style: txtFormTitle.copyWith(
                    color: blackColor,
                  ),
                ),

                const Spacer(),


               InkWell(
                  onTap: () => Get.toNamed(routes),
                  child: SvgPicture.asset(icArrow),
                ),
              ],
            ),
          ),
        ),

        const Divider(color: blackColor80),
      ],
    );
  }
}
