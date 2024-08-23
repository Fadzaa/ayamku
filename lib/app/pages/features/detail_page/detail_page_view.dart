import 'dart:ffi';

import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/items/schedule_order.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/section/detail_page_section.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_alert.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_button_pay.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:ayamku_delivery/app/pages/global_component/common_loading.dart';

import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteController = Get.put(FavouritePageController());
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: baseColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icBack,
                width: 30,
                height: 30,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (controller.token.value.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommonAlert(
                            image: guest,
                            title: 'Kamu sedang dalam mode guest',
                            content: "Silahkan login untuk melanjutkan",
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () async {
                              Get.back();
                              Get.toNamed(Routes.LOGIN_PAGE);
                            },
                            confirmText: 'Login Sekarang',
                            cancelText: 'Lanjutkan guest mode',
                          );
                        },
                      );
                    } else{
                      Get.toNamed(Routes.CART_PAGE);
                    }
                  },
                  child: SvgPicture.asset(
                    icCart,
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    if (controller.token.value.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CommonAlert(
                            image: guest,
                            title: 'Kamu sedang dalam mode guest',
                            content: "Silahkan login untuk melanjutkan",
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () async {
                              Get.back();
                              Get.toNamed(Routes.LOGIN_PAGE);
                            },
                            confirmText: 'Login Sekarang',
                            cancelText: 'Lanjutkan guest mode',
                          );
                        },
                      );
                    } else {
                      favouriteController.addFavourite(controller.detailProduct.value.id?? 0);
                    }
                  },
                  child: Obx(() => SvgPicture.asset(
                    favouriteController.isProductFavorite(controller.detailProduct.value.id?? 0) == true ? favFill : icFavorite,
                    width: 24,
                    height: 24,
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        height:screenHeight,
        color: baseColor,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Obx((){
                if (controller.isLoading.value) {
                  return Center(child: commonLoading());
                } else {
                  return DetailPageSection();
                }
              }),
            ),
          )
        ),
      ),
      bottomNavigationBar: Obx(() {
        return CommonButtonPay(
          txtColor:
          controller.storeStatus == 1 ? blackColor : blackColor40,
          color:
          controller.storeStatus == 1 ? primaryColor : blackColor90,
          width: 150,
          text: 'Tambahkan',
          // price: Future.value(controller.formatPrice(controller.totalPrice.value)),
          price: controller.formatPrice(controller.totalPrice.value),
          onPressed: () {

            if (controller.token.value.isEmpty){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CommonAlert(
                    title: 'Kamu dalam mode guest',
                    content: "Silahkan login untuk melanjutkan",
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () async {
                      Get.back();
                      Get.offAllNamed(Routes.LOGIN_PAGE);
                    },
                    confirmText: 'Login Sekarang',
                    cancelText: 'Tetap lanjutkan guest mode',
                    image: guest,
                  );
                },
              );
            } else if (controller.storeStatus == 1){
              controller.addToCart();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CommonAlert(
                    title: 'Pesanan tidak dapat dilakukan',
                    content: "Silahkan coba lain waktu",
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () async {
                      Get.back();
                    },
                    confirmText: 'Ok',
                    cancelText: '',
                    image: time,
                  );
                },
              );
            }
          },

        );
      })
    );
  }
}
