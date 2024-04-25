import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_catatan.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_level.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_select_minuman.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/item_title.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/minuman_data.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailPageView extends GetView<DetailPageController>{
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: baseColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SvgPicture.asset(
                  icBack,
                  width: 30,
                  height: 30,
                ),

                SvgPicture.asset(
                  icFavorite,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 80),
            decoration: BoxDecoration(
              color: baseColor
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount : food_data.length,
              itemBuilder: (BuildContext context, int index) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Image.asset(
                      food_data[index].image,
                      width: 363,
                    ),
                  ),

                  ItemTitle(
                    title: food_data[index].name,
                    rating: food_data[index].rating,
                    description: food_data[index].description,
                    quantity: controller.quantityCount,
                    add: controller.inCrementQuantity,
                    min: controller.decrementQuantity,
                  ),

                  SizedBox(height: 20,),

                  Text("Pilih level geprek",style: txtListItemTitle,),

                  SizedBox(height: 10,),

                  ItemSelectLevel(),

                  SizedBox(height: 20,),

                  Text.rich(
                    TextSpan(
                        text: "Pilih minuman ",
                        style: txtListItemTitle,
                        children: [
                          TextSpan(
                            text: "(opsional)",
                            style: txtListItemTitle.copyWith(
                                color: blackColor50
                            ),
                          )
                        ]
                    ),
                  ),

                  SizedBox(height: 10,),

                  ItemSelectMinuman(
                    name: minuman_data[index].name,
                    value: '',
                  ),


                  SizedBox(height: 20,),

                  Text.rich(
                    TextSpan(
                        text: "Catatan ",
                        style: txtListItemTitle,
                        children: [
                          TextSpan(
                            text: "(opsional)",
                            style: txtListItemTitle.copyWith(
                                color: blackColor50
                            ),
                          )
                        ]
                    ),
                  ),

                  SizedBox(height: 10,),

                  ItemCatatan(),

                  SizedBox(height: 25,)
                ],
              ),
            ),
          )
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CommonButtonPay(
            width: 150,
            text: 'Add to cart ',
            price: 'Rp.13.000',
          ),
        ),

      ],
    );
  }

}