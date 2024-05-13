import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_date.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';

class SectionRiwayat extends StatelessWidget {
  const SectionRiwayat({super.key, required this.txtDate});

  final String txtDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ItemFilterDate(),

          SizedBox(height: 20,),

          Text(
              txtDate,
            style: txtHeadline3,
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              ItemListRiwayat(
                image: exampleFood,
                name: 'PAHE GEPREK',
                date: '20 Jan 2024',
              ),

              ButtonConfirm()

            ],
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              ItemListRiwayat(
                image: exampleFood,
                name: 'PAHE GEPREK',
                date: '20 Jan 2024, 1:54 pm',
              ),

              ButtonBuy()

            ],
          ),

          SizedBox(height: 40,),

          Center(
            child: Text(
                "You’ve seen all your orders.",
              style: txtCaption.copyWith(color: blackColor50),
            ),
          )
        ],
      ),
    );
  }
}
