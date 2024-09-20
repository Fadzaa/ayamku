import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/items/item_list_makanan.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_search.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_textfield.dart';
import 'package:ayamku_delivery/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../router/app_pages.dart';

class ListMakananView extends GetView<ListMakananController> {
  const ListMakananView({super.key});

  @override
  Widget build(BuildContext context) {
    final String category = (Get.arguments as String?) ?? '';


    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Text(
              "$category ",
              style: txtTitlePage.copyWith(
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 15,),

              CommonSearch(
                text: "Temukan $category favorit kamu",
                controller: controller.searchController,
              ),

              SizedBox(height: 15),
              Expanded(
                  child: ContentPage(
                    category: category,
                    listCategory: controller.listProduct,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentPage extends GetView<ListMakananController> {
  const ContentPage({
    Key? key,
    required this.listCategory,
    required this.category,
  }) : super(key: key);

  final List<Product> listCategory;
  final String category;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final favouriteController = Get.put(FavouritePageController());

    return Obx(() {
      if (controller.isLoading.value) {
        return commonLoading();
      } else if (listCategory.isEmpty) {
        return Center(
          child: NotFoundPage(
            image: ic_empty,
            title: "Data tidak ditemukan",
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          controller.getProductCategory(category);
        },
        child: ListView.builder(
          itemCount: listCategory.length,
          itemBuilder: (context, index) {
            final product = listCategory[index];
            final isFavourite = RxBool(favouriteController.isProductFavorite(product.id ?? 0));
            final id = (favouriteController.favouriteResponse.data != null && index < favouriteController.favouriteResponse.data!.length) ? favouriteController.favouriteResponse.data![index].id ?? 0 : 0;

            return ItemListMakanan(
              onTap: () {
                Get.toNamed(Routes.DETAIL_PAGE, parameters: {'id': product.id!.toString(), 'favouriteId': id.toString()});
              },
              name: product.name!,
              desc: product.description!,
              image: product.image!,
              rating: product.ratingAvg!.toInt(),
              price: formatCurrency.format(product.price ?? 0),
              id: product.id ?? 0,
              totalRating: product.totalRating!.toInt(),
              isFavorite: isFavourite,
              // onFav: () async {
              //   if (controller.token.value.isEmpty) {
              //     showDialog(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return CommonAlert(
              //           image: guest,
              //           title: 'Kamu sedang dalam mode guest',
              //           content: "Silahkan login untuk melanjutkan",
              //           onCancel: () {
              //             Get.back();
              //           },
              //           onConfirm: () async {
              //             Get.back();
              //             Get.toNamed(Routes.LOGIN_PAGE);
              //           },
              //           confirmText: 'Login Sekarang',
              //           cancelText: 'Lanjutkan guest mode',
              //         );
              //       },
              //     );
              //   } else {
              //     if (favouriteController.isProductFavorite(product.id!)) {
              //       await favouriteController.deleteFavourite(id, product.id!);
              //     } else {
              //       await favouriteController.addFavourite(product.id!);
              //     }
              //     await favouriteController.getFavourite();
              //     await controller.getProductCategory(category);
              //   }
              // },

            );
          },
        ),
      );
    });
  }
}