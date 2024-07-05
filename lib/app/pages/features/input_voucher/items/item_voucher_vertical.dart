import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';

class ItemVoucherVertical extends StatelessWidget {
  ItemVoucherVertical({
    Key? key,
    required this.name,
    required this.duration,
    required this.onPressed}) : super(key: key);

  final String name, duration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        margin: EdgeInsets.only(bottom: 20, right: screenWidth * 0.06, left: screenWidth * 0.06,),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [

                 Container(
                    width: screenWidth,
                    child: Text(
                        name,
                        style: txtListItemTitle.copyWith(color: blackColor),
                    ),
                 ),
                  
                  SizedBox(height: 5,),
                  
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
                                  style: txtBody.copyWith(
                                      color: blackColor
                                  ),
                                ),
                                TextSpan(
                                  text: " hari",
                                  style: txtBody.copyWith(
                                      color: blackColor
                                  ),
                                )
                              ]
                          ),
                        ),


                        Spacer(),

                        CommonButtonOutline(
                          text: "Pakai",
                          style: txtBody.copyWith(color: primaryColor),
                          onPressed: onPressed,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      }
  }