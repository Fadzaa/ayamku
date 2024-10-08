import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemCatatan extends StatelessWidget {
  const ItemCatatan({super.key, required this.noteController});
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: "Catatan ",
                style: txtListItemTitle,
                children: [
                  TextSpan(
                    text: "(opsional)",
                    style: txtListItemTitle.copyWith(
                        color: blackColor50),
                  )
                ]),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            width: screenWidth,
            height: 78,
            child: TextFormField(
              controller: noteController,
              minLines: 5,
              maxLines: 6,
              style: txtCaption,
              decoration: InputDecoration(
                hintText: "Contoh : Tolong dibungkus yang aman",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: blackColor80),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
