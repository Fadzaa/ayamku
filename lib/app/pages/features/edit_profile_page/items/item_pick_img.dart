import 'dart:io';

import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemPickImg extends StatelessWidget {
  const ItemPickImg({
    super.key,
    required this.onTap,
    required this.image
  });

  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                        File(image)
                    ))),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    icCamera,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
