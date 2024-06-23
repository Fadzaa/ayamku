import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/model/cart.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';

import '../../../api/product/model/DetailProductResponse.dart';


class DetailPageController extends GetxController {
  final TextEditingController noteController = TextEditingController();
  RxList<Food> food = food_data;
  RxInt quantityCount = 1.obs;
  final RxString valueDrink = "Es Teh".obs;

  //price
  RxInt totalPrice = 13000.obs;
  RxInt itemPrice = 0.obs;

  //level
  RxString selectedLevel = "Pedas".obs;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  //select metode pickup atau delivery for schedule order
  RxBool isOnDeliverySelected = true.obs;
  void selectOnDelivery() {
    isOnDeliverySelected.value = true;
  }
  void selectPickUp() {
    isOnDeliverySelected.value = false;
  }

  //select schedule time
  final selectedTime = ''.obs;
  final selectedDate = ''.obs;
  final timeList = [
    '15:00-15:30',
    '15:30-16:00',
    '16:00-16:30',
  ].obs;
  final dateList = [
    'Hari ini',
    'Besok',
    'Sabtu',
  ].obs;
  void selectTimeDate(String time,date) {
    selectedTime.value = time;
    selectedDate.value = date;
  }

  //fetch detail product
  Rx<DetailProduct> detailProduct = DetailProduct().obs;
  ProductService productService = ProductService();
  RxBool isLoadingAll = false.obs;
  DetailProductResponse detailProductResponse = DetailProductResponse();

  //fetch store status
  final homeController = Get.put(HomePageController());
  int? storeStatus;



  @override
  void onInit() {
    super.onInit();
    storeStatus = homeController.storeStatus?.value;
    getDetailProduct('1');
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

  void getDetailProduct (String id) async {
      try {
        isLoadingAll.value = true;

        final response = await productService.getDetailProduct(id);

        print("Fetch Semua Pos");
        print(response.data);

        detailProductResponse = DetailProductResponse.fromJson(response.data);
        detailProduct = detailProductResponse.data!.obs;

        print("Fetch Semua Pos");
        //print(listProduct);


        print(detailProductResponse.data);
      } catch (e) {
        isLoadingAll.value = true;
        print(e);
      } finally {
        isLoadingAll.value = false;
      }
    }


}
 