import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_pesanan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_status.dart';
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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

          // ItemFilterPesananKamu(),

          Container(
            width: 180,
              child: ItemFilterStatus()),

          SizedBox(height: 20,),

          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.getOrder,
                  child: ListView.builder(
                    itemCount: listOrder.length,
                    itemBuilder: (context, index) {
                      final data = listOrder[index];
                      return InkWell(
                        onTap: () {
                          print('Data to pass: ${data.id.toString()}, ${data.cart?.cartItems}, ${data.status.toString()}');
                          Get.toNamed(Routes.DETAIL_ORDER_PAGE, arguments: {
                            'orderId': data.id.toString(),
                            'cartItems': data.cart?.cartItems,
                            'status' : data.status.toString(),
                            'date': DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt.toString())),
                            'method' : data.methodType.toString(),
                          });
                        },
                        child: ItemListPesananKamu(
                          orderId: data.id.toString(),
                          status: data.status.toString(),
                          image: exampleFood,
                          name: data.id.toString(),
                          date: DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt.toString())),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          })



          // Center(
          //   child: Text(
          //     "You’ve seen all your orders.",
          //     style: txtCaption.copyWith(color: blackColor50),
          //   ),
          // )
        ],
      ),
    );
  }
}
