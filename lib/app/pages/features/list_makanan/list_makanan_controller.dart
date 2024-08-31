import 'dart:async';

import 'package:ayamku_delivery/app/api/api_endpoint.dart';
import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/home_page/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListMakananController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final favoriteController = Get.put(FavouritePageController());

  late ProductService productService;
  late ListProductResponse listProductResponse;
  List<Product> listProduct = <Product>[];
  final token = RxString('');

  var arguments = Get.arguments;
  RxBool isProductFavoriteVariable = false.obs;

  void isProductFavoriteNew(String productName) {
    for (var item in favoriteController.favouriteItems) {
      if (item.name == productName) {
        print("PRODUCT FAVORITE TRUE");
        isProductFavoriteVariable.value = true;
      }
    }
  }

  RxBool isLoading = false.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    productService = ProductService();
    fetchToken();
    String category = Get.arguments;

    if (category.isNotEmpty) {
      getProductCategory(category);
    }
    favoriteController.getFavourite();

    searchController.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(seconds: 2), () {
        getProductSearch(category, searchController.text);
      });
    });
  }

  @override
  void onClose() {
    _debounce?.cancel();
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

  Future getProductCategory(String category) async {
    try {
      print('value category = ' + category);
      isLoading.value = true;

      final response = await productService.getProductCategory(category: category);
      listProduct.clear();

      print("CHECK RESPONSE CATEGORY");
      print(response.data);
      listProduct.addAll(ListProductResponse.fromJson(response.data).data!);

      // listProductResponse = ListProductResponse.fromJson(response.data);
      // listProduct = listProductResponse.data!;

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getProductSearch(String category, String search) async {
    try {
      print('value category = ' + category);
      print('value search = ' + search);

      isLoading.value = true;

      final response = await productService.getProductSearch(category: category, search: search);
      listProduct.clear();
      listProduct.addAll(ListProductResponse.fromJson(response.data).data!);

    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


}
