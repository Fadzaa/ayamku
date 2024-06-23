import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class OrderPageController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;

  RxString selectedValue = 'Terbaru'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

}