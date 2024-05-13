import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemFilterDate extends StatelessWidget {
  const ItemFilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filter_date = ["Terbaru", "7 Hari yang lalu", "Masukkan tanggal"];
    final OrderPageController controller = Get.put(OrderPageController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_date.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                controller.updateSelectedValue(filter_date[index]);
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValue.value == filter_date[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Text(filter_date[index],
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  backgroundColor: controller.selectedValue.value == filter_date[index] ? primaryColor : baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }
}