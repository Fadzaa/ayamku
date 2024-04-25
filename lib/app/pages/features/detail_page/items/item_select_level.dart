import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemSelectLevel extends StatelessWidget {
  const ItemSelectLevel({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 42,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: blackColor50 // Adjust the width as needed
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: DropdownButton(
          dropdownColor: Colors.white,
          style: txtSecondaryTitle.copyWith(
              color: blackColor40
          ),
          elevation: 1,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          underline: Container(),
          items: <String>['Pedas', 'Sedang', 'Tidak pedas'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: txtSecondaryTitle.copyWith(
                    color: blackColor40
                ),
              ),
            );
          }).toList(),
          hint: const Text("Pilih level"),
          onChanged: (String? newValue) {
            // Implement your logic here
          },
        ),
      ),
    );
  }
}
