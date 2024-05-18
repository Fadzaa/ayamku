import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailPageController extends GetxController{

  RxInt quantityCount = 1.obs;
  final RxString ValueDrink = "Es Teh".obs;
  RxString dropdownValueLevel = "Pedas".obs;


  void onChangeLevel(String level, List<String> items) {
    dropdownValueLevel.value = level;
    items.remove(level);
    items.insert(0, level);
  }


  void addToCart() {
    Get.toNamed(Routes.CHECKOUT_PAGE);
  }

  RxString get orderTypeString => ValueDrink;
  void setOrderType(String drink) {
    ValueDrink.value = drink;
  }


  void decrementQuantity() {
    if (quantityCount > 0) {
      quantityCount--;
    }
  }

  void inCrementQuantity() {
    quantityCount++;
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
