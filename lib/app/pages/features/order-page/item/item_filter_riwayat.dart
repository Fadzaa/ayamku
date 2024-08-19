import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFilterDate extends GetView<OrderPageController> {
  const ItemFilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    print(now);
    final List<String> filter_date = ["Terbaru", "7 Hari yang lalu", "Masukkan tanggal"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_date.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                if (filter_date[index] == "Masukkan tanggal") {
                  controller.selectDate(context);
                  controller.selectedValueRiwayat.value = filter_date[index];
                } else {
                  controller.filterSelectedRiwayat(filter_date[index]);
                }
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValueRiwayat.value == filter_date[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Text(
                    filter_date[index] == "Masukkan tanggal"
                        ? controller.selectedDate.value
                        : filter_date[index],
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  backgroundColor: controller.selectedValueRiwayat.value == filter_date[index] ? primaryColor : baseColor,
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