import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class AlertCancelDialog extends StatelessWidget {
  AlertCancelDialog({super.key, required this.title, required this.desc, required this.txtAccept, required this.onTap1, required this.onTap2});

  final String title, desc, txtAccept;
  final VoidCallback onTap1, onTap2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: baseColor,
      title: Text(
        title,
        style: txtListItemTitle,
        textAlign: TextAlign.center,
      ),
      content: Text(
        desc,
        style: txtBody,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LittleButton(
              onTap: onTap1,
              text: "Tidak",
            ),
            SizedBox(width: 10),
            FullBtn(
                text: txtAccept,
                onTap: onTap2
            ),
          ],
        ),
      ],

    );
  }
}
