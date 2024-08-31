import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../api/product/model/ListProductResponse.dart';
import '../favourite_page_view.dart';

import '../../../../../common/theme.dart';

class ItemFavouriteVertical extends StatelessWidget {
  final String name;
  final String desc;
  final String image;
  final int rating;
  final String price;
  final int id;
  final int productId;

  const ItemFavouriteVertical({
    Key? key,
    required this.name,
    required this.desc,
    required this.image,
    required this.rating,
    required this.price,
    required this.id,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              fit: BoxFit.cover,
              image,
              width: 83,
              height: 83,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(exampleFood, width: 83, height: 83);
              },
            ),
          ),

          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: txtListItemTitle
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
                  Icon(Icons.star, size: 20, color: primaryColor),
                  SizedBox(width: 5),
                  Text(rating.toString(),style: txtCaption),
                  SizedBox(width: 10),
                  Text("."),
                  SizedBox(width: 10),
                  Text(price,style: txtCaption)
                ],
              ),
            ],
          ),

          Spacer(),

          InkWell(
            onTap: (){
              _showBottomSheet(context, id, productId);
            },
            child: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, int id, int productId) {
  final controller = Get.put(FavouritePageController());
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Produk Serupa',
              style: txtListItemTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Divider(color: blackColor40, thickness: 0.5,),
            InkWell(
              onTap: () async {
                await controller.deleteFavourite(id, productId);
                Navigator.pop(context);
                controller.getFavourite();
              },
              child: Text(
                'Hapus Favorit',
                style: txtListItemTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Divider(color: blackColor90, thickness: 9),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batal',
                style: txtHeadline3,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    },
  );
}