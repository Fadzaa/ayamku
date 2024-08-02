import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_order_pos.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_pickup_date.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/items/item_slot_delivery.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSelectMetode extends StatelessWidget {
  const ItemSelectMetode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutPageController());

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
              "Metode Pemesanan",
            style: txtListItemTitle.copyWith(color: blackColor20),
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              ContainerMetode(
                width: 150,
                icon: icDelivery,
                text: "On Delivery",
                borderColor: controller.isTypeOrderSelect.value ? primaryColor : blackColor50,
                onPressed: controller.selectOnDelivery,
              ),

              SizedBox(width: 22,),

              ContainerMetode(
                width: 150,
                icon: icPickup,
                text: "Pick Up",
                borderColor: controller.isTypeOrderSelect.value ? blackColor50 : primaryColor,
                onPressed: controller.selectPickUp,
              ),
            ],
          ),

          SizedBox(height: 20,),

          controller.isTypeOrderSelect.value
              ? Column(
                children: [
                  OrderPos(),

                  SizedBox(height: 20,),

                  ItemSlotDelivery()
                ]
          )
              : ItemPickUpDate(),
        ],
      ),
    );
  }
}

class ContainerMetode extends StatelessWidget {
  const ContainerMetode({
    super.key,
    required this.icon,
    required this.text,
    this.borderColor,
    this.onPressed,
    this.width,
  });

  final String icon, text;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = width ?? (screenWidth - 20);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width?? containerWidth,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor?? blackColor50),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
        child: Row(
          children: [

            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),

            SizedBox(width: 10,),

            Text(
              text,
              style: txtSecondaryTitle.copyWith(color: blackColor40),
            )

          ],
        ),
      ),
    );
  }
}
