import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import '../../../../api/product/model/ListProductResponse.dart';
import '../favourite_page_view.dart';

import '../../../../../common/theme.dart';

class ItemFavouriteVertical extends StatelessWidget {
  final String name;
  final String desc;
  final String image;
  final String rating;
  final String price;
  final String id;

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
      margin: EdgeInsets.symmetric(vertical: 15),
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text(desc),
                Row(
                  children: [
                    Icon(Icons.star, size: 20, color: primaryColor),
                    SizedBox(width: 5),
                    Text(rating),
                    SizedBox(width: 5),
                    Text("Rp. $price"),
                  ],
                ),
              ],
            ),
          ),

          Spacer(),

          InkWell(
            onTap: (){
              _showBottomSheet(context);
            },
            child: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
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
            Text(
              'Hapus Favorit',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
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