import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';
import '../model/ayamku_data.dart';

class ItemTerlarisHorizontal extends StatelessWidget {
  const ItemTerlarisHorizontal({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ayamku_data.length,
        itemBuilder: (context, index) {
          final recommend = ayamku_data[index];

          return Container(
            margin: EdgeInsets.only(right: 20),
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
                  height: 168,
                  width: 275,
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

                      Positioned(
                        top: 125,
                        right: 0,
                        child: Container(
                          width: 90,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                recommend.rating.toString(),
                                style: txtRating.copyWith(color: blackColor),
                              ),
                              SizedBox(width: 5),
                              Text(
                                recommend.review,
                                style: txtRating.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        recommend.name,
                        style: txtListItemTitle.copyWith(color: blackColor),
                      ),

                      SizedBox(height: 5,),

                      Text(
                        recommend.description,
                        style: txtCaption.copyWith(color: blackColor),
                      ),

                      SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Rp. ",
                              style: txtCaption,
                              children: [
                                TextSpan(
                                  text: recommend.price.toString(),
                                  style: txtCaption.copyWith(color: blackColor),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 165),

                          SvgPicture.asset(icFavorite),
                        ],
                      )
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
