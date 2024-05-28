import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDropdown extends StatelessWidget {
  const ItemDropdown({
    super.key,
    required this.levelList,
    required this.selectedValue,
    required this.onChanged,
    this.color,
  });

  final List<String> levelList;
  final Color? color;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih level geprek",
            style: txtListItemTitle,
          ),
          SizedBox(height: 10),
          Container(
            height: 42,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: blackColor50),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              style: txtCaption.copyWith(color: blackColor),
              elevation: 1,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              borderRadius: BorderRadius.circular(8),
              underline: Container(),
              items: levelList.map((String selectedLevel) {
                return DropdownMenuItem<String>(
                  value: selectedLevel,
                  child: Text(
                    selectedLevel,
                    style: txtSecondaryTitle.copyWith(color: color ?? blackColor50),
                  ),
                );
              }).toList(),
              hint: const Text("Pilih Level"),
              onChanged: onChanged,
              value: selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}


