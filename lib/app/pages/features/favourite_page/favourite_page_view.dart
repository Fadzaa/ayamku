import 'package:ayamku_delivery/app/pages/features/favourite_page/items/item_favourite_vertical.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../api/favourite/model/favouriteResponse.dart';
import '../../global_component/common_button.dart';
import 'favourite_page_controller.dart';

class FavouritePageView extends GetView<FavouritePageController> {
  const FavouritePageView({super.key});

  @override
  Widget build(BuildContext context) {

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
                  },
                  child: SvgPicture.asset(
                    icKeranjang,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            )
        ),

        backgroundColor: baseColor,

        body: 
           Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.favouriteItems.isEmpty) {
              return FavouriteEmptyPage();
            } else {
              return ContentPage(listFavorite: controller.favouriteItems);
            }
          }),
        // Obx((){
        //   return ContentPage(
        //     listFavorite: controller.favouriteItems,
        //   );
        // })
    );
  }

}

class ContentPage extends  GetView<FavouritePageController> {
  const ContentPage({
    Key? key,
    required this.listFavorite
    });

  final List<Data> listFavorite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listFavorite.length,
      itemBuilder: (context, index) {
          final product = listFavorite[index].product;
           return ItemFavouriteVertical(
              name: product!.name!,
              desc: product.description!,
              image: product.image!,
              rating: product.rating!,
              price: controller.formatPrice(double.parse(product.price!)),
              id: product.id!.toString(),
            );
        },
    );
  }
}


class FavouriteEmptyPage extends StatelessWidget {
  const FavouriteEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 67),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imgEmptyFav),
              width: 250,
              height: 250,
            ),
            SizedBox(height: 20,),
            Text(
              "Kamu belum memiliki produk favorit",
              style: txtTitlePage.copyWith(
                color: blackColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            CommonButton(
              text: 'Belanja Sekarang',
              onPressed: () {  },
              //height: 56,
            ),
          ],
        ),
      ),

    );
  }
}