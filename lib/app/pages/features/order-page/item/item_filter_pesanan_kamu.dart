import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFilterPesananKamu extends GetView<OrderPageController> {
  const ItemFilterPesananKamu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filter_pesanan_kamu = ["Waktu", "Status"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_pesanan_kamu.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){
                controller.filterSelectedRiwayat(filter_pesanan_kamu[index]);
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValueRiwayat.value == filter_pesanan_kamu[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Text(filter_pesanan_kamu[index],
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  backgroundColor: controller.selectedValueRiwayat.value == filter_pesanan_kamu[index] ? primaryColor : baseColor,
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
