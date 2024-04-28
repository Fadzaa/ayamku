import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemQuantity extends StatelessWidget {
  ItemQuantity({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  String icon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5)
      ),

      child: IconButton(

        icon: SvgPicture.asset(
          icon,
          width: 15,
          height: 15,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
