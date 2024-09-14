import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_drodpown_jurusan.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSelectPayment extends GetView<CheckoutPageController> {
  const ItemSelectPayment({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final List<String> payment_select = ["Cash", "E-Wallet"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pilih Pembayaran",
          style: txtListItemTitle.copyWith(color: blackColor20),
        ),

        SizedBox(height: 10,),

        Container(
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
              items: payment_select.map((String jurusan) => DropdownMenuItem(child: Text(jurusan), value: jurusan,)).toList(),
              hint: const Text("Pilih Kelas"),
              onChanged: (value) =>  controller.onChangePayment(value ?? "10", payment_select),
              value: controller.dropdownValuePayment.value,
            ),)
        ),
      ],
    );
  }
}



