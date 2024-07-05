import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_order_summary.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_payment_summary.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class SectionOrderSummary extends GetView<DetailOrderPageController> {
  SectionOrderSummary({super.key});

  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Order Summary",
            style: txtHeadline3,
          ),

          SizedBox(height: 10,),

          ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              final cartItem = controller.cartItems[index];
              return ItemSectionOrderMenu(
                  image: exampleFood,
                  name: cartItem.productName?? "",
                  level: "Pedas",
                  drink: "Es Teh",
                  price: formatCurrency.format(num.parse(cartItem.totalPrice.toString())),
                  quantity: cartItem.quantity.toString()
              );
            },
          ),



          SizedBox(height: 20,),

          Text(
            "Payment",
            style: txtHeadline3,
          ),

          SizedBox(height: 15,),

          ItemSectionPaymentSummary(),

          SizedBox(height: 25,),

          Text(
            "Metode pembayaran",
            style: txtHeadline3,
          ),

          SizedBox(height: 15,),

          Text(
            "Dana",
            style: txtSecondaryTitle.copyWith(color: blackColor40),
          ),

          SizedBox(height: 20,),

          ItemSectioOrderSummary(
              noPesanan: "A-6WC8S6DWWG20",
              waktuPesanan: "20 Jan 2024, 12.00 pm",
              metodePesanan: controller.orderResponse.data?.methodType.toString() ?? "On Delivery"
          )

        ],
      ),
    );
  }
}

