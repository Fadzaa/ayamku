import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSelectLevel extends StatelessWidget {
  const ItemSelectLevel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> level_select = ["Pedas", "Sedang", "Tidak Pedas"];
    final controller = Get.put(DetailPageController());

    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: screenWidth,
        decoration: BoxDecoration(
            border: Border.all(color: blackColor50),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Obx(() => DropdownButton(
          dropdownColor: Colors.white,
          style: txtCaption.copyWith(color: blackColor),
          elevation: 1,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderRadius.circular(8),
          underline: Container(),
          items: level_select.map((String level) => DropdownMenuItem(child: Text(level), value: level,)).toList(),
          hint: const Text("Pilih Level"),
          onChanged: (value) =>  controller.onChangeLevel(value ?? "Pedas"),
          value: controller.dropdownValueLevel.value,
        ),)
    );
  }
}
