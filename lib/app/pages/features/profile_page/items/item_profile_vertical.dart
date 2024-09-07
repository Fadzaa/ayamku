import 'package:ayamku_delivery/app/pages/features/profile_page/model/profile_data.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/common/theme.dart';

class ItemProfileVertical extends GetView<ProfilePageController> {
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
              routes: controller.token.value.isEmpty ? Routes.LOGIN_PAGE:list_profile[index].routes ?? ""  ,

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
    final ProfilePageController controller = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              if (controller.token.value.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CommonAlert(
                      title: 'Kamu dalam mode guest',
                      content: "Silahkan login untuk melanjutkan",
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () async {
                        Get.back();
                        Get.toNamed(Routes.LOGIN_PAGE);
                      },
                      confirmText: 'Login Sekarang',
                      cancelText: 'Tetap lanjutkan guest mode', image: guest,
                    );
                  },
                );
              } else {

                if(routes == Routes.EDIT_PROFILE_PAGE) {
                  Get.toNamed(routes, arguments: controller.user.value);
                }else {
                  Get.toNamed(routes);
                }
              }
            },
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

                  SvgPicture.asset(icArrow),
                ],
              ),
            ),
          ),
        ),

        const Divider(color: blackColor80),
      ],
    );
  }
}

