import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_date.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SectionRiwayat extends GetView<OrderPageController> {
   SectionRiwayat({
    super.key,
    // required this.listOrder
  });

  // final RxList<Data> listOrder;

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

          Obx(() {
            if ( controller.dataComplete.isEmpty){
              return Center(
                child: NotFoundPage(
                    image: ic_empty,
                    title: "Uuupss.. kamu tidak memiliki riwayat order",
                ));
            } else {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.getOrder,
                  child: ListView.builder(
                    itemCount: controller.dataComplete.length,
                    itemBuilder: (context, index) {
                      final data = controller.dataComplete[index];
                      return InkWell(
                        onTap: () {
                          print('Data to pass: ${data.id.toString()}, ${data.cart?.cartItems}, ${data.status.toString()}');
                          Get.toNamed(Routes.DETAIL_ORDER_PAGE, arguments: {
                            'orderId': data.id.toString(),
                            'cartItems': data.cart?.cartItems,
                            'status' : data.status,
                            'date': DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt.toString())),
                            'method' : data.methodType,
                          });
                        },
                        child: ItemListRiwayat(
                          image: exampleFood,
                          name: data.id.toString(),
                          date: DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt.toString())),
                          orderId: data.id.toString(),
                          status: data.status.toString(),
                        ),
                      );
                    },
                  ),
                )

              );
            }
          }),


          // Center(
          //   child: Text(
          //       "You’ve seen all your orders.",
          //     style: txtCaption.copyWith(color: blackColor50),
          //   ),
          // )
        ],
      ),
    );
  }
}
