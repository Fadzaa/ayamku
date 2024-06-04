import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController {
  TextEditingController searchController = TextEditingController();

  late ProductService productService;
  late ListProductResponse listProductResponse;
  List<Product> listProduct = <Product>[];

  var arguments = Get.arguments;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    productService = ProductService();

    String category = Get.arguments;

    if (arguments is String) {
      getProductCategory(arguments);
    } else {
      print('Invalid arguments');
    }

    searchController.addListener(() {
      getProductSearch(arguments, searchController.text);
    });
  }

  Future getProductCategory(String category) async {
    try {
      listProduct.clear();
      print('value category = ' + category);

      isLoading.value = true;

      final response = await productService.getProductCategory(category: category);
      print("CHECK RESPONSE CATEGORY");
      print(response.data);

      listProductResponse = ListProductResponse.fromJson(response.data);
      listProduct = listProductResponse.data.obs as List<Product>;

    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getProductSearch(String category, String search) async {
    try {
      listProduct.clear();
      print('value category = ' + category);
      print('value search = ' + search);

      isLoading.value = true;

      final response = await productService.getProductSearch(category: category, search: search);
      print("CHECK RESPONSE EACH TYPE CATEGORY");
      print(response.data);

      listProductResponse = ListProductResponse.fromJson(response.data);
      listProduct = listProductResponse.data.obs as List<Product>;

    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

}
