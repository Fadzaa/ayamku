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
  });

  final int quantity;
  final VoidCallback? incrementQuantity;
  final VoidCallback? decrementQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemQuantity(
          icon: icAdd,
          onPressed: decrementQuantity,
        ),

        SizedBox(width: 10),

        Text(
          quantity.toString(),
          style: txtListItemTitle.copyWith(color: blackColor)
        ),

        SizedBox(width: 10),

        ItemQuantity(
          icon: icMin,
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
  });

  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
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
