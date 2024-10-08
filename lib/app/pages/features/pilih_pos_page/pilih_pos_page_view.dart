import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/bottom_selectpos.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_all_vertical.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_drodpown_jurusan.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_dropdown_kelas.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_recommend_horizontal.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/items/item_warningbox.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PilihPosPageView extends GetView<PilihPosPageController>{
  const PilihPosPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getAllPos();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Image.asset(
                        gedungRus,
                        width: screenWidth,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          icBack,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              ClipRRect(
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      )
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Hi, Alyaa Rana 👋",
                                  style: txtTitleMenu),

                              InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.CART_PAGE);
                                },
                                child: SvgPicture.asset(
                                  icCart,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5,),

                          Text("selamat datang di pemilihan pos terdekat",
                              style: txtSecondaryTitle),

                          // SizedBox(height: 15,),

                          // Text("Masukkan kelas dan jurusan",style: txtHeadline3,),
                          //
                          // SizedBox(height: 15,),
                          //
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: ItemDropdownKelas(),
                          //     ),
                          //     SizedBox(width: 20,),
                          //     Expanded(
                          //       child: ItemDropdownJurusan(),
                          //     )
                          //   ],
                          // ),
                          //
                          // SizedBox(height: 15,),
                          //
                          // Text("Rekomendasi pos terdekat",style: txtHeadline3,),
                          //
                          // SizedBox(height: 15,),
                          //
                          // ItemWarningBox(),
                          //
                          // SizedBox(height: 15,),
                          // Obx(() => controller.isLoadingAll.value ? commonLoading() : ItemRecommendHorizontal()),

                          // SizedBox(height: 15,),

                          // Text("Semua pos yang tersedia",style: txtHeadline3,),
                          //
                          // SizedBox(height: 0,),

                          Obx(() => controller.isLoadingAll.value ? commonLoading() : ItemAllVertical(),),

                          SizedBox(height: 30,),

                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomSelectPos(),
    );
  }

}
