import 'package:ayamku_delivery/app/api/order/model/orderResponse.dart';
import 'package:ayamku_delivery/app/api/order/order_service.dart';
import 'package:ayamku_delivery/app/api/voucher/model/redeemVoucherResponse.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/item/item_filter_riwayat.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:ayamku_delivery/common/theme.dart';
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

  var selectStatus = "Status".obs;
  var selectMethod = "Metode".obs;
  var selectTime = "Waktu".obs;


  void setStatus(String value) {
    selectStatus.value = value;
    applyFilters();
  }

  void setMethod(String value) {
    selectMethod.value = value;
    applyFilters();
  }

  void applyFilters() {
    if (data.isEmpty) {
      print("The data list is empty. No filters applied.");
      return;
    }

    List<Data> filteredData = data.where((item) {
      bool statusMatch = selectStatus.value == "Status" || item.status == status(selectStatus.value);
      bool methodMatch = selectMethod.value == "Metode" || item.methodType == method(selectMethod.value);
      return statusMatch && methodMatch;
    }).toList();

    myOrder.assignAll(filteredData);

    print("Filters applied - Status: ${selectStatus.value}, Method: ${selectMethod.value}");
    print("Filtered data count: ${filteredData.length}");
  }

  String status(String displayStatus) {
    switch (displayStatus) {
      case "Dalam Proses":
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
    filterStatus('');
  }

  void resetMethod() {
    selectMethod.value = 'Metode';
    filterSelectedMethod('');
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

    getOrder();

    if (selectedDate.value.isEmpty) {
      selectedDate.value = "Masukkan tanggal";
    }
  }

  void filterData() {
    myOrder.assignAll(data);

    dataComplete.addAll(data.where((item) => item.status == "completed" || item.status == "confirmed_order").toList());
  }

  Future<void> getOrder() async {
    try {
      isLoading(true);
      final response = await orderService.getOrder();
      print("Server response:");
      print(response.data);

      data = OrderResponse.fromJson(response.data).data!;
      filterData();

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

      Get.snackbar(
        "Sukses",
        "Orderan berhasil diupdate",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );
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
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            height: 380,
            child: TableCalenderCustom(
              onDateSelected: (selectedDate) {
                String formattedDate = DateFormat('yyyy-MM-dd', 'id_ID').format(selectedDate);
                this.selectedDate.value = formattedDate;
                filterOrderDate(formattedDate);
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ),
        );
      },
    );
  }

  void filterSelectedRiwayat(String value) {
    selectedValueRiwayat.value = value;
    applyFilter();
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
        filterOrderDate(selectedDate.value);
        break;
    }
    print(selectedValueRiwayat.value);
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

  Future<void> filterOrderDate(String date) async {
    try {
      isLoading.value = true;
      final responseDate = await orderService.getOrderFilterdate(date);

      print("Response data for filterOrderDate:");
      print(responseDate.data);

      if (responseDate.data != null && responseDate.data['data'] is List) {
        List<Data> responseData = (responseDate.data['data'] as List).map((item) => Data.fromJson(item)).toList();
        dataComplete.assignAll(responseData.where((item) => DateFormat('yyyy-MM-dd').format(DateTime.parse(item.createdAt.toString())) == date));
        print("Filtered data:");
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