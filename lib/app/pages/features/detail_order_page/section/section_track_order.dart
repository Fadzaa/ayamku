import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_order_pos.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_timeline.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/model/timeline_date.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionTrackOrder extends GetView<DetailOrderPageController> {
  const SectionTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 16,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Lacak Orderan",
            style: txtHeadline3,
          ),

          SizedBox(height: 15,),

          SizedBox(
            height: 145,
            child: ListView.builder(
              itemCount: timeline_data.length,
              itemBuilder: (context, index) {
                return ItemTimeline(
                    title: timeline_data[index].title,
                    time: timeline_data[index].time,
                    description: timeline_data[index].description);
              },
            ),
          ),



          SizedBox(height: 20,),

          OrderPos(),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
