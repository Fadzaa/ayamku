import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/model/ayamku_data.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../api/product/model/ListProductResponse.dart';

class ItemTerlarisHorizontal extends StatelessWidget {
  const ItemTerlarisHorizontal({
    Key? key,
    required this.listMenuTerlaris
  });

  final List<Data> listMenuTerlaris;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Get.toNamed(Routes.DETAIL_PAGE);
      },
      child: Container(
        height: 283,
        child:  ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listMenuTerlaris.length,
          itemBuilder: (context, index) {
            final menuTerlaris = listMenuTerlaris[index];

            return Container(
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
                    height: 168,
                    width: 275,
                    child: Stack(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            menuTerlaris.image!,
                            fit: BoxFit.fill,
                          ),
                        ),

                        Positioned(
                          top: 125,
                          right: 0,
                          child: Container(
                            width: 90,
                            height: 25,
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
                                SizedBox(width: 5),
                                Text(
                                  menuTerlaris.rating!,
                                  style: txtRating.copyWith(color: blackColor),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  menuTerlaris.totalRating.toString(),
                                  style: txtRating.copyWith(color: blackColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          menuTerlaris.name!,
                          style: txtListItemTitle.copyWith(color: blackColor),
                        ),

                        SizedBox(height: 5,),

                        Text(
                          menuTerlaris.description!,
                          style: txtCaption.copyWith(color: blackColor),
                        ),

                        SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Rp. ",
                                style: txtCaption,
                                children: [
                                  TextSpan(
                                    text: menuTerlaris.price.toString(),
                                    style: txtCaption.copyWith(color: blackColor),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 165),

                            SvgPicture.asset(icFavorite),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },

        )
      ),
    );
  }
}




