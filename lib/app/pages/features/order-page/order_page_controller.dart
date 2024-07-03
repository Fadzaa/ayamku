import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class OrderPageController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  RxBool isLoading = false.obs;

  RxString selectedValue = 'Terbaru'.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    update();
  }

  List<Data> data = <Data>[];
  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this );

    orderService = OrderService();
    getOrder();
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
      } else {
        print("Parsed data is null");
      }
      // data = [orderResponse.data!];
      // print("Parsed order:");
      // print(data);

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