import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/theme.dart';


class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscure,
  });

  TextEditingController controller;
  String hintText;
  bool? isObscure;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: isObscure ?? false,
        style: txtFormTitle,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0), 
          hintStyle: txtFormTitle.copyWith(color: blackColor50),
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: blackColor50
              ),
          ),  

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: blackColor50,
            ),
          ),


        ),
      ),
    );
  }
}