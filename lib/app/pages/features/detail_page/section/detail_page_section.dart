import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_catatan.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_quantity.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_level.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_title.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageSection extends GetView<DetailPageController> {
  const DetailPageSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.network(
            controller.detailProduct.value.image!,
            width: 363,
          ),
        ),

        SizedBox(height: 20),

        ItemTitle(
          title: controller.detailProduct.value.name!,
          rating: controller.detailProduct.value.rating!,
          description: controller.detailProduct.value.description!,
          quantity: controller.quantityCount.value,
          incrementQuantity: controller.incrementQuantity,
          decrementQuantity: controller.decrementQuantity,
          txtColor: controller.storeStatus == 1 ? blackColor : blackColor40,
          color: controller.storeStatus == 1 ? primaryColor : blackColor90,
        ),

        ItemDropdown(
          levelList: controller.levelList,
          selectedValue: controller.selectedLevel.value,
          onChanged: (value) => controller.onChangedLevel(value!),
        ),

        ItemCatatan(
          noteController: controller.noteController,
        ),

        SizedBox(height: 35),
      ],
    );
  }
}

