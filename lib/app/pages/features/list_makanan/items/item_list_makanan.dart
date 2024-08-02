import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:get/get.dart';

class ItemListMakanan extends GetView<ListMakananController> {
  final String name;
  final String desc;
  final String image;
  final String rating;
  final String price;
  final String id;

  const ItemListMakanan({
    Key? key,
    required this.name,
    required this.desc,
    required this.image,
    required this.rating,
    required this.price,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 15,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                image,
                width: 83,
                height: 83,
              ),

              SizedBox(width: 10,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: txtListItemTitle.copyWith(),
                  ),

                  SizedBox(height: 5,),

                  AutoSizeText(desc,
                    style: txtCaption,
                    softWrap: true,
                    maxLines: 2,
                  ),

                  SizedBox(height: 5,),

                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: primaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(rating),
                      SizedBox(width: 10),
                      Text("."),
                      SizedBox(width: 10),
                      Text(price),
                    ],
                  ),
                ],
              ),

              Spacer(),

              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: (){},
              ),
            ],
          ),

          Divider(color: blackColor80,)
        ],
      ),
    );
  }
}
