import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDropdownJurusan extends StatelessWidget {
  const ItemDropdownJurusan({Key? key});

  @override
  Widget build(BuildContext context) {

    final List<String> jurusan_select = ["PPLG", "ANIMASI", "DKV", "DG"];
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
          items: jurusan_select.map((String jurusan) => DropdownMenuItem(child: Text(jurusan), value: jurusan,)).toList(),
          hint: const Text("Pilih Kelas"),
          onChanged: (value) =>  controller.onChangeJurusan(value ?? "10"),
          value: controller.dropdownValueJurusan.value,
        ),)
    );
  }
}
