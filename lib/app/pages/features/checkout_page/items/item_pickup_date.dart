import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_slot_delivery.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemPickUpDate extends StatelessWidget {
  const ItemPickUpDate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutPageController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Masukkan jadwal pengambilan",
          style: txtListItemTitle.copyWith(color: blackColor20),
        ),

        SizedBox(height: 10,),

        Center(
          child: Obx(() => SelectSlot(
            icon: icClock,
            text: controller.selectedTime.value != null
                ? ' Pesanan diambil pada : ${controller.selectedTime.value!.hour}:${controller.selectedTime.value!.minute}'
                : 'Pilih waktu pengambilan',
            onPressed: () {
              // controller.selectPickupTime(context);
            },
          )),
        )

      ],
    );
  }
}



