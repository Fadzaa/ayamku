import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_date.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionRiwayat extends StatelessWidget {
  const SectionRiwayat({
    super.key,
    // required this.txtDate,
    required this.listOrder
  });

  // final String txtDate;
  final List<Data> listOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ItemFilterDate(),

          SizedBox(height: 20,),

          Text(
              "Hari Ini",
            style: txtHeadline3,
          ),

          SizedBox(height: 20,),

          Expanded(
              child: ListView.builder(
                  itemCount: listOrder.length,
                  itemBuilder: (context, index) {
                    final data = listOrder[index];
                    return InkWell(
                      onTap: (){
                        Get.toNamed(Routes.DETAIL_ORDER_PAGE, arguments: data.cart?.cartItems);
                      },
                      child: ItemListRiwayat(
                        image: exampleFood,
                        name: data.id.toString(),
                        date: '20 Jan 2024, 1:54 pm',
                      ),
                    );
                  }
              ),
          ),


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
