import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_order_summary.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/items/item_section_payment_summary.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionOrderSummary extends StatelessWidget {
  const SectionOrderSummary({super.key});

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

          ItemSectionOrderMenu(
              image: exampleFood,
              name: "PAHE Geprek",
              level: "Pedas",
              drink: "Es Teh",
              price: "Rp.13.000",
              quantity: "1"
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
              metodePesanan: "Pick Up"
          )

        ],
      ),
    );
  }
}

