import 'package:ayamku_delivery/app/pages/features/profile_page/model/profile_data.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/common/theme.dart';

class ItemProfileVertical extends StatelessWidget {
  const ItemProfileVertical({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list_profile.length,
        itemBuilder: (context, index) =>
            ItemListProfile(
              icon: list_profile[index].icon,
              name: list_profile[index].name,
              routes: list_profile[index].routes?? "",
              // isDarkMode: list_profile[index].isDarkMode
            )
    );
  }
}

class ItemListProfile extends StatelessWidget {
  const ItemListProfile({
    super.key,
    required this.icon,
    required this.name,
    required this.routes,
  });

  final String icon, name, routes;

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

