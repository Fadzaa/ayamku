import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePicker extends GetView<DetailPageController> {
  const SchedulePicker({super.key});

  String rightDivider() {
    return "|";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: blackColor50),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: CupertinoPicker(
                    backgroundColor: Colors.transparent,
                    itemExtent: 20.0,
                    onSelectedItemChanged: (int index) {
                      controller.selectTimeDate(controller.dateList[index], controller.selectedDate.value);
                    },
                    children: controller.dateList.map((String value) {
                      return Text(value, style: txtListItemTitle.copyWith(color: blackColor),);
                    }).toList(),
                  ),
                ),
              ),
            ),
            Text(rightDivider(), style: TextStyle(fontSize: 20, color: blackColor40)),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: CupertinoPicker(
                    backgroundColor: Colors.transparent,
                    itemExtent: 20.0,
                    onSelectedItemChanged: (int index) {
                      controller.selectTimeDate(controller.timeList[index], controller.selectedTime.value);
                    },
                    children: controller.timeList.map((String value) {
                      return Text(value, style: txtListItemTitle.copyWith(color: blackColor),);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

class DateTimePicker extends StatelessWidget {
  DateTimePicker({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: txtSecondaryTitle.copyWith(color: blackColor40),
        ),
      ),
    );
  }
}
