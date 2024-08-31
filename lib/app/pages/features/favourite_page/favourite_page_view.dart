import 'package:ayamku_delivery/app/pages/features/favourite_page/items/item_favourite_vertical.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../api/favourite/model/favouriteResponse.dart';
import '../../global_component/common_button.dart';
import 'favourite_page_controller.dart';

class FavouritePageView extends StatelessWidget {
   FavouritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritePageController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: baseColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                "Favorit Saya ",
                style: txtTitlePage.copyWith(
                  color: blackColor,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.CART_PAGE);
                },
                child: SvgPicture.asset(
                  icKeranjang,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          )),

      backgroundColor: baseColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: commonLoading());
              } else if (controller.favouriteItems.isEmpty) {
                return Center(
                  child: NotFoundPage(
                      image: imgEmptyFav,
                      title: "Kamu belum memiliki produk favorit",
                  ),
                );
              } return RefreshIndicator(
                onRefresh: () async {
                  await controller.getFavourite();
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.favouriteItems.length,
                    itemBuilder: (context, index) {
                      final product = controller.favouriteItems[index];
                      final id = controller.favouriteResponse.data?[index].id ?? 0;

                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PAGE, parameters: {'id': product.id!.toString(), 'favouriteId': id.toString()});
                        },
                        child: ItemFavouriteVertical(
                          productId: product.id ?? 0,
                          name: product.name ?? '',
                          desc: product.description ?? '',
                          image: product.image ?? '',
                          rating: product.ratingAvg ?? 0,
                          price: controller.formatPrice(product.price ?? 0),
                          id: id,
                        ),
                      );
                    }),
              );
            }),
          ),
        ),
      ),

    );
  }
}


