import 'package:get/get.dart';
import 'home_page_controller.dart';
import 'package:flutter/material.dart';



class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}