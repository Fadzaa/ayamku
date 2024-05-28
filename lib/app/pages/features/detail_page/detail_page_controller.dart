import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/model/cart.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPageController extends GetxController {
  final TextEditingController noteController = TextEditingController();
  RxList<Food> food = food_data;
  RxInt quantityCount = 1.obs;
  final RxString valueDrink = "Es Teh".obs;
  RxInt totalPrice = 13000.obs;
  RxInt itemPrice = 0.obs;
  RxString selectedLevel = "Pedas".obs;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  @override
  void onInit() {
    super.onInit();
    itemPrice.value = food.isNotEmpty ? food.first.price : 0;
    updateTotalPrice();
  }

  void onChangedLevel(String level) {
      selectedLevel.value = level;
      levelList.remove(level);
      levelList.insert(0, level);

  }

  void addToCart() {
    final cartItem = Cart(
      id: food.first.id,
      name: food.first.name,
      price: itemPrice.value,
      count: quantityCount.value,
      total: totalPrice.value,
      image: food.first.image,
      level: selectedLevel.value,
    );
    try {
      Get.put(CartPageController()).addItemToCart(cartItem);
      Get.snackbar('Success', 'Item added to cart');
    } catch (e) {
      Get.snackbar('Error', 'Unable to add item to cart: $e');
    }
  }

  String formatPrice(double price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }


  RxString get orderTypeString => valueDrink;
  void setOrderType(String drink) {
    valueDrink.value = drink;
  }

  void decrementQuantity() {
    quantityCount.value++;
    updateTotalPrice();
  }

  void incrementQuantity() {

    if (quantityCount.value > 1) {
      quantityCount.value--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    totalPrice.value = itemPrice.value * quantityCount.value;
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
