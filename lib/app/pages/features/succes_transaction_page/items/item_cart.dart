import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
  });

  final String image,name,price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: screenWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image,
                  width: 70,
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Text(
                      name,
                      style: txtListItemTitle,
                      maxLines: 2, // Limits the text to 2 lines
                    ),
                  ),


                  SizedBox(height: 10,),
                  Text(
                    price,
                    style: txtSecondaryTitle.copyWith(color: blackColor40),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}