import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import '../favourite_page_view.dart';

import '../../../../../common/theme.dart';

class ItemFavouriteVertical extends StatelessWidget {
  const ItemFavouriteVertical({Key? key}) : super(key: key);

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
          icon: Icon(Icons.more_vert),
          onPressed: () {
            _showBottomSheet(context);
          },
        ),
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
            Text(
              'Batal',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    },
  );
}
