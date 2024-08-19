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
                onTap: () {},
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

                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PAGE,parameters: {'id': product.id!.toString()});
                        },
                        child: ItemFavouriteVertical(
                          name: product.name ?? '',
                          desc: product.description ?? '',
                          image: product.image ?? '',
                          rating: product.ratingAvg ?? 0,
                          price: controller.formatPrice(product.price ?? 0),
                          id: product.id?.toString() ?? '',
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


// class FavouriteEmptyPage extends StatelessWidget {
//   const FavouriteEmptyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 67),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: AssetImage(imgEmptyFav),
//               width: 250,
//               height: 250,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Kamu belum memiliki produk favorit",
//               style: txtTitlePage.copyWith(
//                 color: blackColor,
//                 fontSize: 20,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CommonButton(
//               text: 'Belanja Sekarang',
//               onPressed: () {},
//               //height: 56,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
