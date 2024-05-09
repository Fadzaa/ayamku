import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/model/recommend_data.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemAllVertical extends StatelessWidget {
  const ItemAllVertical({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: recommend_data.length,
      itemBuilder: (context, index) {
        final recommend = recommend_data[index];

        return Container(
          margin: EdgeInsets.only(bottom: 20  ),
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      recommend.name,
                      style: txtListItemTitle.copyWith(color: blackColor),
                    ),

                    SizedBox(height: 5,),

                    Container(
                      width: screenWidth,
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
    );
  }
}