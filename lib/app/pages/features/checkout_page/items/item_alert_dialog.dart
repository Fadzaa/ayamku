import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemAlertDialog extends StatelessWidget {
  final String title;
  final String? message;

  ItemAlertDialog({
    required this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
                title,
                style: txtListItemTitle
            ),

            SizedBox(height: 10),

            Text(
                message!,
                style: txtBody
            ),

            SizedBox(height: 15,),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: txtButtonTab.copyWith(color: blackColor)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: greyWarning,
    );
  }
}
