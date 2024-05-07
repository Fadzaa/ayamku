import 'package:flutter/material.dart';
import '../../../common/theme.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    required this.heading,
    required this.controller,
    required this.hintText  ,
    this.isObscure,
  });

  TextEditingController controller;
  String hintText, heading;
  bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: txtFormTitle,),

        const SizedBox(height: 10,),  

        SizedBox(
          height: 45,
          child: TextField(
          controller: controller,
          obscureText: isObscure ?? false,
          style: txtFormTitle.copyWith(color: blackColor),
          
          decoration: InputDecoration(
            suffixIcon: isObscure == true ? IconButton(
              onPressed: (){
                isObscure = !isObscure!;
              },
              icon: Icon(Icons.visibility_off),
              color: Colors.grey,
            ) : null,
            hintText: hintText,
            hintStyle: txtFormTitle.copyWith(color: Colors.grey[400]),
            
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
                contentPadding: EdgeInsets.only(top: 10, left: 20),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: primaryColor,
              ),
              
            ),
          ),
        ),
        )
      ]
    );
  }
}
