import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class OrderPageController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  RxBool isLoading = false.obs;

  RxString selectedValueRiwayat = 'Terbaru'.obs;

  void filterSelectedRiwayat(String value) {
    selectedValueRiwayat.value = value;
    update();
  }

  List<Data> data = <Data>[];
  RxList<Data> dataProcessing = <Data>[].obs;
  RxList<Data> dataComplete = <Data>[].obs;

  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this );

    orderService = OrderService();
    getOrder();
  }


  void filterData() {
    dataProcessing.assignAll(data.where((item) => item.status == "processing").toList());
    dataComplete.assignAll(data.where((item) => item.status == "complete").toList());
  }

  Future getOrder() async {
    try {
      isLoading(true);
      final response = await orderService.getOrder();
      print("Server response:");
      print(response.data);

      orderResponse = OrderResponse.fromJson(response.data);
      if (orderResponse.data != null) {
        data = [orderResponse.data!];
        filterData();
      } else {
        print("Parsed data is null");
      }

      update();

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }

}