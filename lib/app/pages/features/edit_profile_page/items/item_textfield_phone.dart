import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ItemTextFieldPhone extends StatelessWidget {
  ItemTextFieldPhone({
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

          TextField(
            controller: controller,
            obscureText: isObscure ?? false,
            style: txtFormTitle.copyWith(color: blackColor),
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
              _TextFormatter(),
            ],
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: txtFormTitle.copyWith(color: Colors.grey[400]),
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          )
        ]
    );
  }
}

class _TextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text;

    formattedText = formattedText.replaceAll(RegExp(r'[^\d-]'), '');

    if (formattedText.length > 4 && !formattedText.contains('-')) {
      formattedText = formattedText.substring(0, 4) + '-' + formattedText.substring(4);
    }
    if (formattedText.length > 9 && !formattedText.substring(5).contains('-')) {
      formattedText = formattedText.substring(0, 9) + '-' + formattedText.substring(9);
    }
    if (formattedText.length > 14 && !formattedText.substring(10).contains('-')) {
      formattedText = formattedText.substring(0, 14) + '-' + formattedText.substring(14);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
