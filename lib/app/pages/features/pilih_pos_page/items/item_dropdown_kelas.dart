import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDropdownKelas extends StatelessWidget {
  const ItemDropdownKelas({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<String> kelas_select = ["10", "11", "12"];
    final controller = Get.put(PilihPosPageController());


    return Container(
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        width: 180,
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
          items: kelas_select.map((String kelas) => DropdownMenuItem(child: Text(kelas), value: kelas,)).toList(),
          hint: const Text("Pilih Kelas"),
          onChanged: (value) =>  controller.onChangeKelas(value ?? "10"),
          value: controller.dropdownValueKelas.value,
        ),)
    );
  }
}
