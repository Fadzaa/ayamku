import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/minuman_data.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemSelectMinuman extends StatelessWidget {
  const ItemSelectMinuman({
    super.key,
    required this.name,
    required this.value,
  });

  final String name, value;

  Widget build(BuildContext context) {
    return GetBuilder<DetailPageController>(
      builder: (detailController){
        return InkWell(
          onTap: () => detailController.setSelectDrink(value),
          child: Row(
            children: [

              Radio(
                  value: value,
                  groupValue: detailController.selectedDrink,
                  onChanged: (String? value){
                  },
                activeColor: primaryColor,
              ),

              Text(
                name,
                style: txtSecondaryTitle.copyWith(color: blackColor40),
              ),

            ],
          ),
        );
      }
    );
  }
}
