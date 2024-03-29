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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(image),
        Text(
          text,
          style: txtHeadline2.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: txtBody.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ]
    );
  }
}