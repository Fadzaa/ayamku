import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter_svg/svg.dart';

class ItemSelectPaymentVertical extends StatefulWidget {
  const ItemSelectPaymentVertical({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image, name;

  @override
  _ItemSelectPaymentVerticalState createState() =>
      _ItemSelectPaymentVerticalState();
}

class _ItemSelectPaymentVerticalState extends State<ItemSelectPaymentVertical> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(

          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });

          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(
                  widget.image,
                  width: 24,
                  height: 24,
                ),

                const SizedBox(width: 10),

                Text(
                  widget.name,
                  style: txtFormTitle.copyWith(
                    color: blackColor,
                  ),
                ),
                const Spacer(),

                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isSelected? primaryColor : Colors.grey,
                    ),
                    color: _isSelected? Colors.transparent : Colors.transparent,
                  ),
                  child: _isSelected
                      ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      icActiveRadioButton,
                      width: 13,
                      height: 13,
                    ),
                  )
                      : null,
                ),

              ],
            ),
          ),
        ),
        const Divider(color: blackColor80),
      ],
    );
  }
}
