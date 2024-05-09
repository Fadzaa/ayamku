import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/theme.dart';

class ItemNotificationVertical extends StatelessWidget {
  const ItemNotificationVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: SvgPicture.asset(
          icSpoon,
          width: 83,
          height: 83,
        ),
        title: Text(
          "Pesananan anda telah sampai pada pos yang telah ditentukan. ",
          style: TextStyle(fontSize: 17),
        ),
        subtitle: Text(
          "5 menit yang lalu",
          style: TextStyle(fontSize: 14, color: blackColor50),
        ),
      ),
    );
  }
}
