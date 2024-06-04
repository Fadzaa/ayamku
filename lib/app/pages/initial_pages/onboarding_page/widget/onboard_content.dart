import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../common/theme.dart';


class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.text,
    required this.description,

  }) : super(key: key);

  final String image, text, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              image,
            height: 390,
          ),

          SizedBox(height: 20,),

          Text(
            text,
            style: txtHeadline2.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10,),

          Text(
            description,
            style: txtBody,
            textAlign: TextAlign.center,
          ),
        ]
      ),
    );
  }
}