import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_alert_dialog.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPageController extends GetxController {

  RxBool isOnDeliverySelected = true.obs;
  var selectedTime = Rx<TimeOfDay?>(null);

  void selectOnDelivery() {
    isOnDeliverySelected.value = true;
  }

  void selectPickUp() {
    isOnDeliverySelected.value = false;
  }

  void selectPickupTime(BuildContext context) async {
    TimeOfDay currentTime = TimeOfDay.now();
    TimeOfDay maximumTime = TimeOfDay(hour: 20, minute: 0);

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      if (pickedTime.hour > maximumTime.hour ||
          (pickedTime.hour == maximumTime.hour && pickedTime.minute > maximumTime.minute)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ItemAlertDialog(
                title: "Sesi pickup sudah habis",
                message: "Silahkan pesan besok lagi",
            );
          },
        );
      } else if (pickedTime.hour < currentTime.hour ||
          (pickedTime.hour == currentTime.hour && pickedTime.minute < currentTime.minute)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ItemAlertDialog(
                title: "Silahkan pilih waktu lain",
            );
          },
        );
      } else {
        selectedTime.value = pickedTime;
        update();
      }

    }
  }

}