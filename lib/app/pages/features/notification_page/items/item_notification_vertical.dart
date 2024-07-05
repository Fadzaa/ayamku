  import 'package:ayamku_delivery/common/constant.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_svg/svg.dart';
  import 'package:auto_size_text/auto_size_text.dart';

  import '../../../../../common/theme.dart';

  class ItemNotificationVertical extends StatelessWidget {
    const ItemNotificationVertical({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: primaryColor,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Image.asset(
                    icMaps,
                    width: 83,
                    height: 83,
                  ),
                ),

                SizedBox(width: 15,),


              ],
            ),

            SizedBox(height: 15,),

            Divider(color: blackColor70,)
          ],
        ),
      );
    }
  }
