import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/constant.dart';

class ItemsSeeReviewPage extends StatelessWidget {
  const ItemsSeeReviewPage(
      {super.key,
      required this.image,
      required this.productName,
      required this.comment,
      required this.rating});

  final String image, productName, comment;
  final int rating;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  productName,
                  style: txtListItemTitle,
                ),
              ),
              Spacer(),
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index > 0 ? 5 : 0),
                    child: SvgPicture.asset(
                      index < rating ? starFil : starOutline,
                      width: 20,
                      height: 20,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        Container(
          width: screenWidth * 0.9,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: blackColor),
          ),
          child: Text(comment, style: txtBody),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
