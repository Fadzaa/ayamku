import 'package:ayamku_delivery/app/api/promo/model/activePromoResponse.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../model/promo_data.dart';

class ItemPromoVertical extends GetView<HomePageController>{
  const ItemPromoVertical ({
    Key? key,
  });


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Obx(() {
      if (controller.isLoadingPromo.value) {
        return commonLoading();
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.listPromo.length,
        itemBuilder: (context, index) {
          final promo = controller.listPromo[index];

          return Container(
            margin: EdgeInsets.only(bottom: 20),
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
                  width: screenWidth,
                  child: Stack(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          fit: BoxFit.cover,
                          promo.image,
                          height: 150,
                          width: screenWidth,
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
                        promo.name,
                        style: txtListItemTitle.copyWith(color: blackColor),
                      ),

                      SizedBox(height: 5,),

                      Container(
                        width: screenWidth,
                        child: Text(
                          promo.description,
                          style: txtBody.copyWith(color: blackColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

}