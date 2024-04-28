import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import '../model/cattegory_data.dart';

class ItemCattegoryHorizontal extends StatelessWidget {
  const ItemCattegoryHorizontal({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cattegory_data.length,
        itemBuilder: (context, index) {
          final category = cattegory_data[index];
          return Container(
            margin: EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(5),

                  child: Image.asset(
                    category.image,
                    width: 40,
                    height: 40,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  category.text,
                  style: txtCaption.copyWith(color: blackColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
