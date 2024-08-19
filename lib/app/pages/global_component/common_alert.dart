import 'package:ayamku_delivery/app/pages/features/input_voucher/items/item_voucher_vertical.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonAlert extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String image;

  const CommonAlert({
    Key? key,
    required this.title,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child :  SvgPicture.asset(icCancel,color: Colors.black,)
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset(image),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                  title,
                  style: txtListItemTitle
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                  content,
                  style: txtBody
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 25,  right:25,top: 10),
              child: Column(
                children: [
                  LittleButton(
                      text: confirmText,
                      // style: txtListItemTitle.copyWith(color: primaryColor),
                      onTap: onConfirm),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: onCancel,
                    child: Text(
                      cancelText,
                      style: txtCaption.copyWith(color: blackColor40)
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}


