import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class BottomSelectPos extends StatelessWidget {
  const BottomSelectPos({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey, // Color of the border
            width: 0.5, // Thickness of the border
          ),
        ),
      ),
      child: ButtonSelect(),
    );
  }
}

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {  },
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          elevation: 2,
          fixedSize: Size.fromHeight(44),
      ),

      child: Center(
        child: Text("📌 Pilih Pos",style: txtButtonTab.copyWith(
            color: blackColor
        ),),
      ),
    );
  }
}
