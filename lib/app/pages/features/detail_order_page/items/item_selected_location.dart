import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemSelectedLocation extends StatelessWidget {
  const ItemSelectedLocation({super.key, required this.name, required this.description});

  final String name, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("📌 Pos pengiriman", style: txtListItemTitle.copyWith(color: blackColor20)),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              name,
                              style: txtSecondaryTitle.copyWith(color: blackColor40),
                              maxLines: 1,
                            )
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),

                    AutoSizeText(
                      description,
                      style: txtSecondaryTitle.copyWith(color: blackColor40),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
