
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemSlotDelivery extends StatelessWidget {
  const ItemSlotDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text(
            "Pilih sesi delivery",
          style: txtListItemTitle.copyWith(color: blackColor20),
        ),

        SizedBox(height: 10,),

        SelectSlot(
          icon: icClock,
          text: 'Pilih sesi',
          onPressed: () {

          },
        )
        
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