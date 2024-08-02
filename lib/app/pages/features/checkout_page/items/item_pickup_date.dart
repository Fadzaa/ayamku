import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_slot_delivery.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPickUpDate extends GetView<CheckoutPageController> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pilih waktu pengambilan",
          style: txtListItemTitle.copyWith(color: blackColor20)
        ),
        SizedBox(height: 10),
        Center(
          child: Obx(() => SelectSlot(
            icon: icClock,
            text: controller.selectedTime.value != null
                ? 'Pesanan diambil pada: ${controller.selectedTime.value!.format(context)}'
                : 'Pilih waktu pengambilan',
            onPressed: () {
              showTimePickerDialog(context);
            },
          )),
        ),
      ],
    );
  }

  void showTimePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedHour = 7;
        int selectedMinute = 0;
        return AlertDialog(
          title: Text("Pilih Waktu", style: txtListItemTitle.copyWith(color: blackColor20)),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          onSelectedItemChanged: (index) {
                            selectedHour = 7 + index;
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${7 + index}'.padLeft(2, '0'),
                                  style: TextStyle(fontSize: 24),
                                ),
                              );
                            },
                            childCount: 8, // 07:00 - 14:00
                          ),
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 24),
                      ),
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          perspective: 0.005,
                          diameterRatio: 1.2,
                          onSelectedItemChanged: (index) {
                            selectedMinute = index;
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  '${index * 5}'.padLeft(2, '0'),
                                  style: TextStyle(fontSize: 24),
                                ),
                              );
                            },
                            childCount: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal",style: txtListItemTitle.copyWith(color: blackColor20),),
            ),
            TextButton(
              onPressed: () {
                controller.setTime(TimeOfDay(hour: selectedHour, minute: selectedMinute * 5));
                Navigator.of(context).pop();
              },
              child: Text("Pilih", style: txtListItemTitle.copyWith(color: blackColor20),),
            ),
          ],
        );
      },
    );
  }
}

