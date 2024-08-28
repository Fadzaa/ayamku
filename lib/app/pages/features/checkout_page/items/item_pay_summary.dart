import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPaySummary extends GetView<CheckoutPageController> {
  const ItemPaySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rincian Pembayaran",
          style: txtListItemTitle.copyWith(color: blackColor20),
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            children: [
              ItemPay(text: "SubTotal", price: controller.formatPrice(controller.totalPrice.value ?? 0)),
              ItemPay(text: "Biaya potongan voucher" , price: controller.formatPrice(controller.discount.value ?? 20)),
              // ItemPay(text: "Biaya potongan voucher" , price: "Rp. 2.000"),
              // ItemPay(text: "Biaya admin", price: "Rp. 13.000"),
              // ItemPay(text: "Total bayar", price: "Rp. 13.000"),
            ],
          ),
        )
      ],
    );
  }
}


class ItemPay extends StatelessWidget {
  const ItemPay({
    super.key,
    required this.text,
    required this.price
  });

  final String text,price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
              text,
            style: txtSecondaryTitle.copyWith(color: blackColor40),
          ),

          Text(
              price,
            style: txtSecondaryTitle.copyWith(color: blackColor40),
          ),

        ],
      ),
    );
  }
}

