import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemFilterStatus extends GetView<OrderPageController> {
  ItemFilterStatus({super.key});



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final List<String> status_select = ["Dalam proses", "Selesai", "Telah dikonfirmasi", "Dibatalkan"];

    return Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        width: screenWidth,
        decoration: BoxDecoration(
            border: Border.all(color: blackColor50),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Obx(() => DropdownButton(
          dropdownColor: Colors.white,
          style: txtCaption.copyWith(color: blackColor),
          elevation: 1,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderRadius.circular(15),
          underline: Container(),
          items: status_select.map((String status) => DropdownMenuItem(child: Text(status), value: status,)).toList(),
          hint: const Text("Status"),
          onChanged: (value) =>  controller.filterSelectedStatus(value ?? "Dalam proses"),
          value: controller.selectedStatus.value,
        ),)
    );
  }
}
