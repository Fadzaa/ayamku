import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/voucher/model/redeemVoucherResponse.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPageController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabController;
  RxBool isLoading = false.obs;

  RxString selectedValueRiwayat = 'Terbaru'.obs;
  RxString selectedDate = ''.obs;

  RxString selectStatus = "Status".obs;
  RxString selectMethod = "Metode".obs;
  RxString selectTime = "Waktu".obs;


  void setStatus(String value) {
    String apiStatus = status(value);
    selectStatus.value = "Status: $value";
    filterStatus(apiStatus);
    //applyAllFilters();
  }

  void setMethod(String value) {
    String apiMethod = method(value);
    selectMethod.value = "Metode: $value";
    filterSelectedMethod(apiMethod);
    //applyAllFilters();
  }


  String status(String displayStatus) {
    switch (displayStatus) {
      case "Dalam proses":
        return "processing";
      case "Telah Diterima":
        return "accept";
      case "Pesanan Selesai":
        return "completed";
      case "Telah dikonfirmasi":
        return "confirmed_order";
      case "Dibatalkan":
        return "cancelled";
      default:
        return "";
    }
  }

  String method(String displayMethod) {
    switch (displayMethod) {
      case "On Delivery":
        return "on_delivery";
      case "Pickup":
        return "pickup";
      default:
        return "";
    }
  }

  void filterStatus(String value) {
    myOrder.clear();
    if (value == "") {
      myOrder.addAll(data);
    } else {
      myOrder.addAll(data.where((item) => item.status == value).toList());
    }
    update();
  }

  void filterSelectedMethod(String value) {
    myOrder.clear();
    if (value == "") {
      myOrder.addAll(data);
    } else {
      myOrder.addAll(data.where((item) => item.methodType == value).toList());
    }
    update();
  }

  void setTime(String value) {
    selectTime.value = "Waktu: $value";
  }

  void resetStatus() {
    selectStatus.value = 'Status';
  }

  void resetMethod() {
    selectMethod.value = 'Metode';
  }

  void resetTime() {
    selectTime.value = 'Waktu';
  }

  List<Data> data = <Data>[];
  RxList<Data> myOrder = <Data>[].obs;
  RxList<Data> dataComplete = <Data>[].obs;

  OrderService orderService = OrderService();
  OrderResponse orderResponse = OrderResponse();

  //fetch redeem voucher
  RedeemVoucher voucherCode = RedeemVoucher();
  RedeemVoucherResponse redeemVoucherResponse = RedeemVoucherResponse();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this );

    orderService = OrderService();
    getOrder();
  }

  void filterData() {
    myOrder.assignAll(data);

    // dataComplete.addAll(data.where((item) => item.status == "completed" || item.status ==  "accept").toList());
    dataComplete.addAll(data.where((item) => item.status == "completed").toList());
  }

  Future<void> getOrder() async {
    try {
      isLoading(true);
      final response = await orderService.getOrder();
      print("Server response:");
      print(response.data);

      if (response.data != null && response.data['data'] is List) {
        data = (response.data['data'] as List).map((item) => Data.fromJson(item)).toList();
        filterData();
      } else {
        print("Parsed data is not a list");
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

  Future<void> updateStatus(String id, String status) async {
    try {
      isLoading.value = true;

      final response = await orderService.updateOrderStatus(id, status);

      print("Update order status response: ${response.data}");


    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  void confirmOrder (String orderId) {
    updateStatus(orderId, 'confirmed_order');
  }

  RxList<String> cancelledOrders = <String>[].obs;

  bool isOrderCancelled(String orderId) {
    return cancelledOrders.contains(orderId);
  }

  void cancelOrder(String orderId) {
    updateStatus(orderId, 'cancelled');
    cancelledOrders.add(orderId);
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      selectedDate.value = formattedDate;
      filterOrderDate(formattedDate, "date");
    }
  }

  void filterSelectedRiwayat(String value) {
    selectedValueRiwayat.value = value;
    if (value != 'Masukkan tanggal') {
      applyFilter();
    }
    update();
  }

  void applyFilter() {
    switch (selectedValueRiwayat.value) {
      case 'Terbaru':
        filterLatest(DateTime.now().toString());
        break;
      case '7 Hari yang lalu':
        filter7days("7days");
        break;
      case 'Masukkan tanggal':
        if (selectedDate.value != 'Masukkan tanggal') {
          filterOrderDate(selectedDate.value, "date");
        }
        break;
    }
    print(selectedDate.value);
  }

  Future<void> filterLatest(String date) async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrderFilterLatest(date);
      print("Filter order date");
      print(response.data);
      if (response.data != null && response.data['data'] is List) {
        dataComplete.assignAll((response.data['data'] as List).map((item) => Data.fromJson(item)).toList());
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> filter7days(String days) async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrderFilter7days(days);
      print("Filter order date");
      print(response.data);
      if (response.data != null && response.data['data'] is List) {
        dataComplete.assignAll((response.data['data'] as List).map((item) => Data.fromJson(item)).toList());
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> filterOrderDate(String date, String filter) async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrderFilterdate(date, filter);

      print("Response data for filterOrderDate:");
      print(response.data);

      if (response.data != null && response.data['data'] is List) {
        List<Data> responseData = (response.data['data'] as List).map((item) => Data.fromJson(item)).toList();
        data.assignAll(responseData.where((item) => DateFormat('yyyy-MM-dd').format(DateTime.parse(item.createdAt.toString())) == date));
      } else {
        print("Response data is not a list or is null.");
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

}