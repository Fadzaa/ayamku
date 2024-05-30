import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../router/app_pages.dart';


class HomePageController extends GetxController {

  late PageController pageController;
  RxInt pageIndex = 0.obs;

  late ProductService productService;
  late ListProductResponse listProductResponse;
  RxBool isLoading = false.obs;


  List<Data> listProductTerlaris = <Data>[];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    productService = ProductService();

    getAllProductTerlaris();
  }

  Future<void> getAllProductTerlaris() async {
    try {
      isLoading(true);
      final response = await productService.getAllProductTerlaris();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      listProductResponse = ListProductResponse.fromJson(response.data);
      listProductTerlaris = listProductResponse.data!;

      print(listProductTerlaris);


    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

}