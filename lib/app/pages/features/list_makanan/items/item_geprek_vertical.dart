import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';

class ItemGeprekVertical extends StatelessWidget {
  const ItemGeprekVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          exampleFood,
          width: 83,
          height: 83,
        ),
        title: Text(
          "PAHE Geprek",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nasi + Ayam Geprek + Teh"),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20, 
                  color: primaryColor,
                  ),
                SizedBox(width: 5),
                Text("4.5 (3K)"),
                SizedBox(width: 5),
                Text("Rp. 13.000"),
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