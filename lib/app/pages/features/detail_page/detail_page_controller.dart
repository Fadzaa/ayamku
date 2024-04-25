import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailPageController extends GetxController{
  int quantityCount = 0;

  String _selectedDrink = 'Es teh';
  String get selectedDrink => _selectedDrink;

  void setSelectDrink (String drink) {
    _selectedDrink = drink;
    update();
  }

  bool isSelectedDrink(String payment) {
    return _selectedDrink == payment;
  }

  void decrementQuantity() {
    quantityCount--;
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
