import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_pesanan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_pesananan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_pesanan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_timeline.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/model/timeline_date.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionPesananKamu extends GetView<OrderPageController> {
  const SectionPesananKamu({super.key, required this.listOrder});

  final List<Data> listOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ItemFilterPesananKamu(),

          SizedBox(height: 20,),

          Obx((){
            if(controller.isLoading.value){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: listOrder.length,
                    itemBuilder: (context, index) {
                      final data = listOrder[index];
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.DETAIL_ORDER_PAGE, arguments: data.cart?.cartItems);
                        },
                        child: ItemListPesananKamu(
                          image: exampleFood,
                          name: data.id.toString(),
                          date: '20 Jan 2024, 1:54 pm',
                        ),
                      );
                    }
                ),
              );
            }
          }),


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
