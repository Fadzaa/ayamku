import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:table_calendar/table_calendar.dart';

class ItemFilterDate extends GetView<OrderPageController> {
  const ItemFilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<String> filter_date = ["Terbaru", "7 Hari yang lalu", "Masukkan tanggal"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: List.generate(filter_date.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                if (filter_date[index] == "Masukkan tanggal") {
                  controller.selectDate(context);
                  controller.selectedValueRiwayat.value = filter_date[index];
                } else {
                  controller.filterSelectedRiwayat(filter_date[index]);
                }
              },
              child: ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  side: controller.selectedValueRiwayat.value == filter_date[index]
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey),
                ),
                child: Chip(
                  label: Text(
                    filter_date[index] == "Masukkan tanggal"
                        ? _formatDate(controller.selectedDate.value)
                        : filter_date[index],
                    style: txtCaption.copyWith(color: blackColor),
                  ),
                  backgroundColor: controller.selectedValueRiwayat.value == filter_date[index]
                      ? primaryColor
                      : baseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          );
        }),
      )),
    );
  }

  // Function to format the date in Indonesian format
  String _formatDate(String date) {
    if (date.isEmpty) return date;

    DateTime parsedDate;
    try {
      parsedDate = DateFormat('yyyy-MM-dd').parse(date);
    } catch (e) {
      return "Masukkan Tanggal";
    }

    return DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);
  }

}

class TableCalenderCustom extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const TableCalenderCustom({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    return Container(
        child: TableCalendar(
          firstDay: DateTime.utc(today.year, 1, 1),
          lastDay: DateTime.utc(today.year, today.month + 1, today.day),
          focusedDay: today,
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: txtHeadline3,
          ),
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            onDateSelected(selectedDay);
          },
        ));
  }
}
