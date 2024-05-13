import 'package:ayamku_delivery/app/pages/features/order-page/order_page_controller.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemSelectOrder extends StatelessWidget {
  const ItemSelectOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrderPageController>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              txtOrder(
                text: "Riwayat",
                isSelected: controller.selectedOption.value == "Riwayat",
                onPressed: () => controller.updateSelectedOption("Riwayat"),
              ),

              SizedBox(width: 20),

              txtOrder(
                text: "Dalam proses",
                isSelected: controller.selectedOption.value == "Dalam proses",
                onPressed: () => controller.updateSelectedOption("Dalam proses"),
              ),

            ],
          ),
        ),
        Divider(
          color: blackColor90,
          thickness: 0.5,
        ),
        Obx(() => controller.getSelectedSection()),
      ],
    );
  }
}

class txtOrder extends StatelessWidget {
  const txtOrder({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onPressed,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text(
        text,
        style: txtButtonTab.copyWith(
          color: isSelected ? primaryColor : blackColor90,
        ),
      ),
    );
  }
}