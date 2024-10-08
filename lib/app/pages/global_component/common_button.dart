import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant.dart';
import '../../../common/theme.dart';

class CommonButton extends StatelessWidget {
   CommonButton({
    super.key,
     required this.text,
     required this.onPressed,
     this.width,
     this.height,
     this.style,
     this.borderRadius,
     this.color,
     this.txtColor,
   });

    String text;
    double? width;
    double? height;
    VoidCallback? onPressed;
    TextStyle? style;
    double? borderRadius;
    Color? color;
    Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color?? primaryColor,
          fixedSize: Size(width ?? double.maxFinite, height ?? 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15)
          ),
        ),
        child: Text(
          text,
          style: style ?? txtButtonTab.copyWith(
            color: txtColor?? blackColor,
          ),
        )

    );
  }
}

class CommonButtonGoogle extends StatelessWidget {
  

   CommonButtonGoogle({
    required this.text,
    super.key,

  });

  //dynamic variable
  String text;
  
  //dynamic widget

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(
                color: Colors.black,
                width: 1)
          ),
 
        ),
        

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icGoogle, width: 20  , height: 20, ),
            const SizedBox(width: 10,),
            Text(
              text,
              style: txtButtonTab.copyWith(
                color: blackColor,
                fontWeight: FontWeight.w600,)
            ),

            const SizedBox(width: 10,),

            
          ],
        )

    );
  }
}

class CommonButtonOutline extends StatelessWidget {
  CommonButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.colorBorder,
    this.style,
  });

  String text;
  VoidCallback onPressed;
  TextStyle? style;
  Color? color;
  Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorBorder ?? primaryColor,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child:  Container(
            width: MediaQuery.of(context).size.width * 0.223,
            child: Text(
                text,
                style: style ?? txtButtonTab
            ),
          ),
        ),
      ),
    );
  }
}