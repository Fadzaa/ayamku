import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemDropdownKelas extends StatelessWidget {
  const ItemDropdownKelas({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 180,

      child: DropdownButtonFormField<String>(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        iconSize: 22,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: blackColor50,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),

        hint: Text('Pilih kelas kamu',style: txtSecondaryTitle.copyWith(
            color: blackColor40
        ),),
        onChanged: (String? newValue) {
          // Implement your logic here
        },
        items: <String>['10', '11', '12']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}