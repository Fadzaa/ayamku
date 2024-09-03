import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../api/product/model/ListProductResponse.dart';

class ItemTerlarisHorizontal extends GetView<HomePageController> {
  const ItemTerlarisHorizontal({
    Key? key
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );


    return Obx(() {
      if (controller.isLoadingProduct.value) {
        return commonLoading();
      }

      return  Container(
        height: screenHeight * 0.3,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.listProduct.length,
          itemBuilder: (context, index) {
            final menuTerlaris = controller.listProduct[index];

            // Add return keyword here
            return InkWell(
                onTap: (){
                  Get.toNamed(Routes.DETAIL_PAGE, parameters: {'id': menuTerlaris.id.toString()});
                },
                child: MenuTerlaris(
                    image: menuTerlaris.image!,
                    name: menuTerlaris.name ?? "",
                    description: menuTerlaris.description ?? "",
                    rating: menuTerlaris.ratingAvg ?? 0,
                    totalRating: menuTerlaris.totalRating!,
                    price: formatCurrency.format(menuTerlaris.price ?? 0),
                )
            );
          },
        ),
      );
    });
  }
}



class MenuTerlaris extends StatelessWidget {
  const MenuTerlaris({super.key, required this.image, required this.name, required this.description, required this.rating, required this.totalRating, required this.price});

  final String image, name, description,  price;
  final int totalRating;
  final int rating;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.65,
      height: screenHeight * 0.6,
      margin: EdgeInsets.only(right: 20,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 400,
            height: 165,
            child: Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: screenWidth * 0.65,
                  ),
                ),

                Positioned(
                  top: 125,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 16,
                        ),
                        SizedBox(width: 1),
                        Text(
                          rating.toString(),
                          style: txtRating.copyWith(color: blackColor),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "($totalRating review)",
                          style: txtBody.copyWith(color: blackColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                 name,
                  style: txtListItemTitle.copyWith(color: blackColor),
                ),

                SizedBox(height: 5,),

                Text(
                  description,
                  style: txtCaption.copyWith(color: blackColor),
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 5,),

                Text(
                  price.toString(),
                  style: txtCaption.copyWith(color: blackColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}





