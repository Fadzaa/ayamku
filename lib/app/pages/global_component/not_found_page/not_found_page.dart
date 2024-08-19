import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
    required this.image,
    required this.title,
    // required this.subtitle
  });

  // final String image, title, subtitle;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 250,),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                title,
                style: txtButtonTab.copyWith(
                    color: blackColor40
                ),
              ),
            ),
          ),

          // Text(
          //   subtitle,
          //   style: tsBodySmall.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: greyColor
          //   ),
          // ),

          const SizedBox(height: 100,)



        ],
      ),
    );
  }
}