import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
    this.color,
    this.txtColor,
  });

  final int quantity;
  final VoidCallback? incrementQuantity;
  final VoidCallback? decrementQuantity;
  final Color? color,txtColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemQuantity(
          color: color?? primaryColor,
          txtColor: txtColor?? blackColor,
          icon: icMin,
          onPressed: decrementQuantity,
        ),

        SizedBox(width: 10),

        Text(
          quantity.toString(),
          style: txtListItemTitle.copyWith(color: txtColor?? blackColor)
        ),

        SizedBox(width: 10),

        ItemQuantity(
          color: color?? primaryColor,
          txtColor: txtColor?? blackColor,
          icon: icAdd,
          onPressed: incrementQuantity,
        ),
      ],
    );
  }
}

class ItemQuantity extends StatelessWidget {
  const ItemQuantity({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.txtColor,
  });

  final String icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: color?? primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          color: txtColor?? blackColor,
          icon,
          width: 15,
          height: 15,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
