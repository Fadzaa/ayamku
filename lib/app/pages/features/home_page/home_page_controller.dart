import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:ayamku_delivery/app/api/promo/model/activePromoResponse.dart';
import 'package:ayamku_delivery/app/api/promo/promo_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../router/app_pages.dart';


class HomePageController extends GetxController {

  late PageController pageController;
  RxInt pageIndex = 0.obs;

  //product terlaris
  late ProductService productService;
  late ListProductResponse listProductResponse;
  List<Data> listProduct = <Data>[];

  //active promo
  late PromoService promoService;
  late ActivePromo listPromoResponse;
  List<Datum> listPromo = <Datum>[];

  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    productService = ProductService();
    promoService = PromoService();

    getAllProductTerlaris();
    getAllActivePromo();
  }

  Future<void> getAllProductTerlaris() async {
    try {
      isLoading(true);
      final response = await productService.getAllProductTerlaris();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      listProductResponse = ListProductResponse.fromJson(response.data);
      listProduct = listProductResponse.data!;

      print(listProduct);


    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllActivePromo() async {
    try {
      isLoading(true);
      final response = await promoService.getAllActivePromo();

      print("CHECK RESPONSE");
      print(response.data);

      listPromoResponse = ActivePromo.fromJson(response.data);
      listPromo = listPromoResponse.data!;

      print(listPromo);


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