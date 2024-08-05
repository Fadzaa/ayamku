import 'package:ayamku_delivery/app/pages/features/lihat_penilaian/lihat_penilaian_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LihatPenilaianPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LihatPenilaianPageController());
  }
}
