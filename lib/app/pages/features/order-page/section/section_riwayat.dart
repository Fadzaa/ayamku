import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_list_riwayat.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
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

          Obx(() {
            String displayDate;
            DateFormat dateFormat = DateFormat('d MMMM yyyy', 'id_ID');

            if (controller.selectedValueRiwayat.value == "Terbaru") {
              displayDate = dateFormat.format(DateTime.now());
            } else if (controller.selectedValueRiwayat.value == "7 Hari yang lalu") {
              DateTime sevenDaysAgo = DateTime.now().subtract(Duration(days: 7));
              displayDate = dateFormat.format(sevenDaysAgo) + " - " + dateFormat.format(DateTime.now());
            } else if (controller.selectedValueRiwayat.value == "Masukkan tanggal" && controller.selectedDate.value.isNotEmpty) {
              try {
                DateTime parsedDate = DateTime.parse(controller.selectedDate.value);
                displayDate = dateFormat.format(parsedDate);
              } catch (e) {
                displayDate = "Tanggal tidak valid";
              }
            } else {
              displayDate = "";
            }

            return Text(
              displayDate,
              style: txtHeadline3,
            );
          }),



          SizedBox(height: 20,),

          Obx(() {
            if ( controller.isLoading.value) {
              return Center(child: commonLoading());

            }else if(controller.dataComplete.isEmpty) {
              return Center(
                  child: NotFoundPage(
                    image: imgEmpty,
                    title: "Kamu tidak memiliki riwayat order",
                  ));
            } else {
              return Expanded(
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
                        });
                      },
                      child: ItemListRiwayat(
                        orderId: data.id ?? 0,
                        status: data.status ?? "",
                        image: data.cart?.cartItems?[0].productImage ?? '',
                        name: data.cart?.cartItems?[0]?.productName??'PAHE',
                        date: DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(data.createdAt.toString())),
                      ),
                    );
                  },
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
