import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartPageController>(() => CartPageController());
  }
}