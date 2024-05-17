import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemCatatan extends StatelessWidget {
  const ItemCatatan({super.key, t});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 78,
      child: TextFormField(
        minLines: 5,
        maxLines: 6,
        style: txtCaption,
        decoration: InputDecoration(
          hintText: "Contoh : Tolong dibungkus yang aman",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: blackColor80),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
