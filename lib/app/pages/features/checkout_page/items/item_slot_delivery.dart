
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemSlotDelivery extends StatelessWidget {
  ItemSlotDelivery({super.key});

  final homeController = Get.put(HomePageController());

  String displayTime() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 10 && currentHour < 12) {
      return "12.00";
    } else if (currentHour >= 7 && currentHour < 10) {
      return "09.40";
    } else {
      return "besok";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        // Text(
        //     "Pilih sesi delivery",
        //   style: txtListItemTitle.copyWith(color: blackColor20),
        // ),
        //
        // SizedBox(height: 10,),
        //
        // SelectSlot(
        //   icon: icClock,
        //   text: 'Pilih sesi',
        //   onPressed: () {
        //
        //   },
        // )

        Text.rich(
          TextSpan(
              text: homeController.storeStatus == 1 ? "Pesanan kamu akan diantarkan pada " : "",
              style: txtListItemTitle,
              children: homeController.storeStatus == 1 ? [
                TextSpan(
                  text: displayTime(),
                  style: txtListItemTitle.copyWith(
                      color: primaryColor
                  ),
                )
              ] : []
          ),
        ),
        
      ],
    );
  }
}



class SelectSlot extends StatelessWidget {
  const SelectSlot({
    Key? key,
    this.controller,
    required this.icon,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String? icon, text;
  final TextEditingController? controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: blackColor50),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text!,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                  InkWell(
                    onTap: onPressed,
                    child: SvgPicture.asset(icon!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}