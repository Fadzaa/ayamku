import 'package:ayamku_delivery/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:ayamku_delivery/app/pages/initial_pages/onboarding_page/widget/dot_indicator.dart';

import '../model/promo_list.dart';

class ItemPromoHorizontal extends GetView<HomePageController>{
  const ItemPromoHorizontal ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: PageView.builder(
              controller: controller.pageController,
              itemCount: promoList.length,
              onPageChanged: (index) {
                controller.onPageChanged(index);
              },
              itemBuilder: (context, index) =>
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(examplePromo),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
          ),
        ),

        const SizedBox(height: 15,),

        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ...List.generate(promoList.length, (index) =>
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: DotIndicator(
                    isActive: index == controller.pageIndex.value,
                  ),
                ),
            ),

          ],
        ),
        ),
      ],
    );
  }

}