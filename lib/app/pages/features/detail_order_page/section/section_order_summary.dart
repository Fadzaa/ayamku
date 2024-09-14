import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_order_summary.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_payment_summary.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_selected_location.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SectionOrderSummary extends GetView<DetailOrderPageController> {
  SectionOrderSummary({super.key});

  final formatCurrency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: txtHeadline3,
          ),
          SizedBox(
            height: 10,
          ),
          (argument != null &&
                  argument['cartItems'] != null &&
                  argument['cartItems'].length > 0)
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: argument['cartItems'].length,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItem = argument['cartItems'][index];
                    return ItemSectionOrderMenu(
                        image: cartItem.productImage.toString(),
                        name: cartItem.productName,
                        level: "Pedas",
                        drink: "Es Teh",
                        price: formatCurrency.format(cartItem.totalPrice ?? 0),
                        quantity: cartItem.quantity?.toString() ?? "0");
                  },
                )
              : Text("Maaf, anda tidak memiliki List Order"),
          SizedBox(
            height: 20,
          ),
          ItemSelectedLocation(
            name: argument["method"] == "pickup"
                ? "ambil di tempat"
                : (argument["namePos"] ?? ""),
            description: argument["method"] == "pickup"
                ? ""
                : (argument["descPos"] ?? ""),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Payment",
            style: txtHeadline3,
          ),
          SizedBox(
            height: 15,
          ),
          ItemSectionPaymentSummary(),
          SizedBox(
            height: 25,
          ),
          Text(
            "Metode pembayaran",
            style: txtHeadline3,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  argument['payment'] == "cash"
                      ? money
                      : argument['payment'] == "DANA"
                      ? dana
                      : argument['payment'] == "LINKAJA"
                      ? link
                      : argument['payment'] == "OVO"
                      ? ovo
                      : argument['payment'] == "QRIS"
                      ? qris
                      : argument['payment'] == "ShopeePay"
                      ? pay
                      : money,
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                argument['payment'] ?? "",
                style: txtSecondaryTitle.copyWith(color: blackColor40),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ItemSectioOrderSummary(

            waktuPesanan: argument['date'] ?? "",
            metodePesanan: argument['method'] ?? "",
            sessionOrder: argument['method'] == "on_delivery"
                ? argument['shift_delivery']?.toString() ?? ""
                : argument['method'] == "pickup"
                    ? argument['pickup_time']?.toString() ?? ""
                    : "",
          )
        ],
      ),
    );
  }
}
