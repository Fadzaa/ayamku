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
                icon: icDelivery,
                text: "On Delivery",
                borderColor: controller.isOnDeliverySelected.value ? primaryColor : blackColor50,
                onPressed: controller.selectOnDelivery,
              ),
              ContainerMetode(
                icon: icPickup,
                text: "Pick Up",
                borderColor: controller.isOnDeliverySelected.value ? blackColor50 : primaryColor,
                onPressed: controller.selectPickUp,
              ),
            ],
          ),

          SizedBox(height: 20,),

          controller.isOnDeliverySelected.value
              ? Column(
                children: [
                  OrderPos(),

                  // SizedBox(height: 20,),
                  //
                  // ItemSlotDelivery()
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
    required this.borderColor,
    this.onPressed
  });

  final String icon, text;
  final Color borderColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 22),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
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
