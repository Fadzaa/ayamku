import 'package:ayamku_delivery/app/pages/features/review_order_page/review_order_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewOrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewOrderPageController>(() => ReviewOrderPageController());
  }
}
