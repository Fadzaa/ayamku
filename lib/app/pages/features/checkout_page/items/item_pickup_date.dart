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
        Text("Pilih waktu pengambilan",
            style: txtListItemTitle.copyWith(color: blackColor20)),
        SizedBox(height: 10),
        Center(
          child: Obx(() => controller.isStoreClosed
              ? SelectSlot(
            icon: '',
            text: 'Tidak dapat melakukan pesanana',
            onPressed: () {
              Get.snackbar('Mohon maaf', 'Toko sedang tutup');
            },
          )
              : SelectSlot(
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
    TimeOfDay now = TimeOfDay.now();
    int selectedHour = now.hour;
    int selectedMinute = now.minute;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Waktu",
              style: txtListItemTitle.copyWith(color: blackColor20)),
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
                            selectedHour = now.hour + index;

                            if (selectedHour == now.hour) {
                              selectedMinute = now.minute;
                            }
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              int displayHour = now.hour + index;
                              if (displayHour > 14) return null;
                              return Center(
                                child: Text(
                                  '${displayHour}'.padLeft(2, '0'),
                                  style: TextStyle(fontSize: 24),
                                ),
                              );
                            },
                            childCount: 15 - now.hour,
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
                            if (selectedHour == now.hour && now.minute + 20 <= 60) {
                              selectedMinute = (index + now.minute + 20) % 60;
                            } else {
                              selectedMinute = (index + 1) % 60;
                            }
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) {
                              int displayMinute;
                              if (selectedHour == now.hour && now.minute + 20 <= 60) {
                                displayMinute = (index + now.minute + 20) % 60;
                              } else {
                                displayMinute = (index + 1) % 60;
                              }
                              return Center(
                                child: Text(
                                  '${displayMinute}'.padLeft(2, '0'),
                                  style: TextStyle(fontSize: 24),
                                ),
                              );
                            },
                            childCount: 60,
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
              child: Text("Batal",
                  style: txtListItemTitle.copyWith(color: blackColor20)),
            ),
            TextButton(
              onPressed: () {
                controller.setTime(
                    TimeOfDay(hour: selectedHour, minute: selectedMinute));
                Navigator.of(context).pop();
              },
              child: Text("Pilih",
                  style: txtListItemTitle.copyWith(color: blackColor20)),
            ),
          ],
        );
      },
    );
  }
}
