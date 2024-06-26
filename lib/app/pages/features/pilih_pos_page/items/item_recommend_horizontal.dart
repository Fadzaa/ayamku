import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/model/recommend_data.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemRecommendHorizontal extends StatelessWidget {
  const ItemRecommendHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommend_data.length,
        itemBuilder: (context, index) {
          final recommend = recommend_data[index];

          return Container(
            width: 275,
            margin: EdgeInsets.only(right: 20, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          recommend.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        recommend.name,
                        style: txtListItemTitle.copyWith(color: blackColor),
                      ),

                      SizedBox(height: 5,),


                      Container(
                        width: 270,
                        child: Text(
                          recommend.description,
                          style: txtCaption.copyWith(color: blackColor),
                        ),
                      ),

                      SizedBox(height: 5,),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

