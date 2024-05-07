import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailPageController extends GetxController{

  RxInt quantityCount = 0.obs;
  final RxString ValueDrink = "Es Teh".obs;
  RxString dropdownValueLevel = "Pedas".obs;


  void onChangeLevel(String level) {
    dropdownValueLevel.value = level;
  }

  RxString get orderTypeString => ValueDrink;
  void setOrderType(String level) {
    ValueDrink.value = level;
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
