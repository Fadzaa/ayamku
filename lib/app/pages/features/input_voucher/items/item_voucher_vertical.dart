import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../../../../common/theme.dart';

class ItemVoucherVertical extends StatelessWidget {
  ItemVoucherVertical(
      {Key? key,
      required this.name,
      required this.duration,
      required this.onPressed})
      : super(key: key);

  final String name, duration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.only(
        bottom: 20,
        right: screenWidth * 0.06,
        left: screenWidth * 0.06,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                child: Text(
                  name,
                  style: txtListItemTitle.copyWith(color: blackColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Berakhir dalam ",
                          style: txtBody.copyWith(color: blackColor50),
                          children: [
                            TextSpan(
                              text: duration,
                              style: txtBody.copyWith(color: blackColor),
                            ),
                            TextSpan(
                              text: " hari",
                              style: txtBody.copyWith(color: blackColor),
                            )
                          ]),
                    ),
                    Spacer(),
                    // LittleButton(
                    //     onTap: onPressed,
                    //     text: "Pakai"
                    // )
                  ],
                ),
              ),

              SizedBox( height: 15,),

              DottedLine(
                dashLength: 15,
                dashGapLength: 5,
                lineThickness: 2,
                dashColor: grey,
              ),

              SizedBox( height: 15,),

              Align(
                alignment: Alignment.topLeft,
                child: LittleButton(
                    onTap: onPressed,
                    text: "Pakai"
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LittleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final Color? color;

  const LittleButton({Key? key, required this.onTap, required this.text, this.style, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: color ?? primaryColor,
              width: 1,
            ),
            color: baseColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: style ?? txtCaption.copyWith(
              color: primaryColor,
            ),
          ),
        ));
  }
}
