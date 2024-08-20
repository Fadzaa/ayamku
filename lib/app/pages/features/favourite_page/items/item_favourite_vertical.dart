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

  const ItemFavouriteVertical({
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 83,
            height: 83,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(exampleFood, width: 83, height: 83);
            },
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
              Text(desc,style: txtCaption,),
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
              _showBottomSheet(context, id);
            },
            child: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, int id) {
  final controller = Get.put(FavouritePageController());
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Produk Serupa',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Divider(height: 20, thickness: 2),
            InkWell(
              onTap: () async {
                await controller.deleteFavourite(id);
                Navigator.pop(context);
                controller.getFavourite();
              },
              child: Text(
                'Hapus Favorit',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 20, thickness: 10),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batal',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    },
  );
}