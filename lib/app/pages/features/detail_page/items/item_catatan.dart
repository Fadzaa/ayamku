import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemCatatan extends StatelessWidget {
  const ItemCatatan({super.key, t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        style: TextStyle(fontSize: 12), // Set font size to 12
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: blackColor80), // Set border thickness to 0.5 and color to blue
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 12), // Set content padding to 8 vertical, 12 horizontal
        ),
      ),
    );
  }
}
