import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/section/detail_page_section.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailPageController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: baseColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CART_PAGE);
                  },
                  child: SvgPicture.asset(
                    icCart,
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.FAVOURITE_PAGE);
                  },
                  child: SvgPicture.asset(
                    icFavorite,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Obx(() => ListView.builder(
                  itemCount: controller.food.length,
                  itemBuilder: (BuildContext context, int index) {
                    final food = controller.food[index];
                    return DetailPageSection(
                      noteController: controller.noteController,
                      image: food.image,
                      txtTitle: food.name,
                      txtDesc: food.description,
                      selectedLevel: controller.selectedLevel.value,
                      quantityCount: controller.quantityCount.value,
                      levelList: controller.levelList,
                      rating: food.rating,
                      onChangedLevel: (value) => controller.onChangedLevel(value!),
                      incrementQuantity: controller.incrementQuantity,
                      decrementQuantity: controller.decrementQuantity,
                    );
                  },
                )
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(() {
              return CommonButtonPay(
                width: 150,
                text: 'Add to cart',
                price: controller.formatPrice(controller.totalPrice.value.toDouble()),
                onPressed: () {
                  controller.addToCart();
                  Get.toNamed(Routes.CART_PAGE);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
