import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../common/theme.dart';

class ItemIntlPhone extends StatelessWidget {
  ItemIntlPhone({
    super.key,
    required this.heading,
    required this.controller,
  });

  TextEditingController controller;
  String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: txtFormTitle,),

        const SizedBox(height: 10,),

        IntlPhoneField(
          decoration: InputDecoration(
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
          controller: controller,
          initialCountryCode: 'ID',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
      ],
    );
  }
}