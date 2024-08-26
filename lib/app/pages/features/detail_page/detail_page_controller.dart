import 'dart:async';

import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/home_page_controller.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/favourite/model/favouriteResponse.dart';
import '../../../api/product/model/DetailProductResponse.dart';
import '../favourite_page/favourite_page_controller.dart';


class DetailPageController extends GetxController {
  final favoriteController = Get.put(FavouritePageController());

  final TextEditingController noteController = TextEditingController();
  RxBool isLoading = false.obs;
  final RxString valueDrink = "Es Teh".obs;
  RxInt quantityCount = RxInt(1);
  RxInt itemPrice = RxInt(0);
  RxInt totalPrice = RxInt(0);
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
  DetailProductResponse detailProductResponse = DetailProductResponse();

  //store cart
  Rx<CartsResponse> cart = CartsResponse().obs;
  CartService cartService = CartService();
  Cart cartsResponse = Cart();

  //fetch store status
  final homeController = Get.put(HomePageController());
  int? storeStatus;

  String? id;
  final token = RxString('');

  RxBool isProductFavoriteVariable = false.obs;

  void isProductFavoriteNew(String productName) {
    for (var item in favoriteController.favouriteItems) {
      if (item.name == productName) {
        print("PRODUCT FAVORITE TRUE");
        isProductFavoriteVariable.value = true;
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
    storeStatus = homeController.storeStatus?.value;
    id = Get.parameters['id'] ?? '';
    if (id != null) {
      getDetailProduct(id!);
    }
    fetchToken();
    updateTotalPrice();
    favoriteController.getFavourite();


    print("CHECK CURRENT TOKEN VALUE");
    print(token.value);
  }

  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  void onChangedLevel(String level) {
      selectedLevel.value = level;
      levelList.remove(level);
      levelList.insert(0, level);

  }

  Future<void> addToCart() async {
    try {
      isLoading.value = true;

      dio.FormData formData = dio.FormData.fromMap({
        'product_id': detailProduct.value.id.toString(),
        'quantity': quantityCount.value.toString(),
      });

      await cartService.storeCart(
          formData
      );

      Get.snackbar("Add to cart Success", "Cart has been updated");

      print("Add to Cart");
      print(cart);
      Get.toNamed(Routes.CART_PAGE);

    } catch (e) {
      isLoading.value = true;
      if (e is dio.DioError && e.response?.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } else {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

  RxString get orderTypeString => valueDrink;
  void setOrderType(String drink) {
    valueDrink.value = drink;
  }

  void decrementQuantity() {
    if (quantityCount.value > 1) {
      quantityCount.value--;
      updateTotalPrice();
    }
    print("Total price");
    print(totalPrice);
  }

  void incrementQuantity() {
    quantityCount.value++;
    updateTotalPrice();
    print("Total price");
    print(totalPrice);
  }

  void updateTotalPrice() {
    totalPrice.value = itemPrice.value * quantityCount.value;
    print(totalPrice);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  void getDetailProduct(String id) async {
    try {
      isLoading.value = true;

      final response = await productService.getDetailProduct(id);

      print("Fetch Product Detail");
      print(response.data);

      detailProductResponse = DetailProductResponse.fromJson(response.data);
      detailProduct = detailProductResponse.data!.obs;

      // Update itemPrice with the fetched product price
      itemPrice.value = double.parse(detailProduct.value.price.toString()).round();
      updateTotalPrice();

      isProductFavoriteNew(detailProduct.value.name.toString());

      print("Fetch Product Detail");
      print(detailProductResponse.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


}
 