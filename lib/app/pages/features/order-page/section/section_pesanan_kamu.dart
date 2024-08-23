import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_pesanan%20kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_pesananan_kamu.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
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
    listOrder.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ItemsFilterPesananKamu(),

          // Container(
          //   width: 180,
          //     child: ItemFilterStatus()),

          SizedBox(height: 20,),

          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: commonLoading(),
              );
            } else if ( listOrder.isEmpty) {
              return Center(
                  child: NotFoundPage(
                    image: imgEmpty,
                    title: "Kamu tidak memiliki pesanan tersebut",
                  ));
            }else {
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
                            'date': DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(data.createdAt.toString())),
                            'method' : data.methodType.toString(),
                            'voucher' : data.voucher.toString(),
                            'final_amount' : int.tryParse(data.finalAmount.toString()) ?? 0,
                            'discount_amount' : int.tryParse(data.discountAmount.toString()) ?? 0,
                            'pickup_time' : data.pickupTime.toString(),
                            'shift_delivery' : data.shiftDelivery.toString(),
                            'originalAmount' : int.tryParse(data.originalAmount.toString()) ?? 0,
                            'review' : data.reviews,
                            'namePos' : data.post?.name.toString(),
                            'descPos' : data.post?.description.toString(),
                          });
                        },
                        child: ItemListPesananKamu(
                          orderId: data.id ?? 0,
                          status: data.status ?? "",
                          image: exampleFood,
                          name: data.cart?.cartItems?[0]?.productName??'',
                          date: DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(data.createdAt.toString())),
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
