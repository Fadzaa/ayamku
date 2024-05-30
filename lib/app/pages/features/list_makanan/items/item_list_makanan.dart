import 'package:flutter/material.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';

class ItemListMakanan extends StatelessWidget {
  final String name;
  final String desc;
  final String image;
  final String rating;
  final String price;

  const ItemListMakanan({
    Key? key,
    required this.name,
    required this.desc,
    required this.image,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.network(
          image,
          width: 83,
          height: 83,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(desc),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: primaryColor,
                ),
                SizedBox(width: 5),
                Text(rating),
                SizedBox(width: 5),
                Text(price),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ),
    );
  }
}
