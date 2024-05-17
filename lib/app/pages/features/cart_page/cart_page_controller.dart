import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CartPageController extends GetxController{

  RxString dropdownValue = "Pedas".obs;
  int quantityCount = 1;

  void onChangeDropdown(String selectedLevel, List<String> items) {
    dropdownValue.value = selectedLevel;
    items.remove(selectedLevel);
    items.insert(0, selectedLevel);
  }


  void decrementQuantity() {
    quantityCount--;
  }

  void inCrementQuantity() {
    quantityCount++;
  }

  void checkIsProductEmpty() {

  }

  String formatPrice(double price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
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