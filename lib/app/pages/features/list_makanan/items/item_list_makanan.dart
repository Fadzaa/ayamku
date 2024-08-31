import 'package:auto_size_text/auto_size_text.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemListMakanan extends GetView<ListMakananController> {
  final String name;
  final String desc;
  final String image;
  final int rating;
  final int totalRating;
  final String price;
  final int id;
  final VoidCallback onTap;
  final RxBool isFavorite;
  final VoidCallback onFav;

  const ItemListMakanan({
    Key? key,
    required this.name,
    required this.desc,
    required this.image,
    required this.rating,
    required this.price,
    required this.totalRating,
    required this.onTap,
    required this.id,
    required this.isFavorite,
    required this.onFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fit: BoxFit.cover,
                    image,
                    width: 83,
                    height: 83,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.5,
                      child: Text(
                        name,
                        style: txtListItemTitle.copyWith(),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: screenWidth * 0.5,
                      child: Text(
                        desc,
                        style: txtCaption,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: primaryColor,
                        ),
                        SizedBox(width: 3),
                        Text(rating.toString()),
                        SizedBox(width: 5),
                        Text("($totalRating)"),
                        SizedBox(width: 10),
                        Text(price),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: onFav,
                  child: Obx(() {
                    return SvgPicture.asset(
                      isFavorite.value ? favFill : icFavorite,
                      width: 24,
                      height: 24,
                    );
                  } )
                  )
              ],
            ),
            Divider(color: blackColor80),
          ],
        ),
      ),
    );
  }
}


