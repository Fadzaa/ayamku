import 'package:ayamku_delivery/app/pages/features/order-page/confirm_order_view.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListRiwayat extends StatelessWidget {
  const ItemListRiwayat(
      {super.key,
      required this.image,
      required this.name,
      required this.date,
      required this.orderId,
      required this.status});

  final String name, date, status;
  final String image;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: txtListItemTitle,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                date,
                style: txtSecondaryTitle.copyWith(color: blackColor40),
              ),
            ],
          ),
          Spacer(),


          status == "completed"
              ? ButtonConfirm(
            onTap: (){
              Get.to(ConfirmOrderView(orderId: orderId.toString()));
            },
          )
              : status == "confirmed_order"
              ? FullBtn(
            text: "Beli Lagi",
            onTap: () {
              Get.toNamed(Routes.CART_PAGE);
            },
          )
              : Container(),
        ],
      ),
    );
  }
}

class ButtonConfirm extends StatelessWidget {
  ButtonConfirm({super.key, this.onTap});

  // final int orderId;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: (){
      //   Get.to(ConfirmOrderView(orderId: orderId,));
      // },
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor)),
        child: Text(
          "Konfirmasi",
          style: txtCaption.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}

class FullBtn extends StatelessWidget {
  FullBtn({super.key, required this.text, required this.onTap, this.color});

  final String text;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: color ?? primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor)),
        child: Text(
          text,
          style: txtCaption.copyWith(color: blackColor),
        ),
      ),
    );
  }
}
