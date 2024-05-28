import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';

class ItemVoucherVertical extends StatelessWidget {
  const ItemVoucherVertical({Key? key}) : super(key: key);

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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),

              child: Image.asset(examplePromo),

            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [

                 Container(
                    width: screenWidth,
                    child: Text(
                        "Diskon makanan 50%, maks. 30rb",
                        style: txtListItemTitle.copyWith(color: blackColor),
                    ),
                 ),
                  
                  SizedBox(height: 5,),
                  
                  Container(
                    width: screenWidth,
                    child: Row(
                      children: [

                        Text(
                          "Berlaku hingga  20 Feb 2024",
                          style: txtBody.copyWith(color: blackColor),
                        ),

                        Spacer(),

                        SizedBox(
                          //width: 68, 
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {}, 
                            child: Text(
                              "Pakai",
                              style: TextStyle(
                                color: primaryColor
                              ),
                            ),
                            
                            style: ElevatedButton.styleFrom(
                              backgroundColor: baseColor,
                              foregroundColor: baseColor,
                              surfaceTintColor: baseColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16), // Border radius
                                side: BorderSide(color: primaryColor,width: 1), // Border berwarna kuning
                              ),
                            ),
                          ),
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