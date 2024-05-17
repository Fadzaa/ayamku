import 'package:ayamku_delivery/app/pages/features/order-page/section/section_dalam_proses.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/section/section_riwayat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class OrderPageController extends GetxController{

  RxString selectedValue = 'Terbaru'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

}