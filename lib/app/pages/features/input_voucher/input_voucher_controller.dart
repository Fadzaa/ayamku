import 'package:ayamku_delivery/app/api/voucher/model/redeemVoucherResponse.dart';
import 'package:ayamku_delivery/app/api/voucher/voucher_service.dart';
import 'package:ayamku_delivery/app/router/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/voucher/model/voucherResponse.dart';

class InputVoucherController extends GetxController {

  RxBool isLoading = false.obs;
  String redeemedVoucherCode = '';
  int voucherDiscount = 0;

  // fetch all voucher
  List<Data> voucherList = <Data>[];
  VoucherService voucherService = VoucherService();
  VoucherResponse voucherResponse = VoucherResponse();

  //fetch redeem voucher
  RedeemVoucher voucherCode = RedeemVoucher();
  RedeemVoucherResponse redeemVoucherResponse = RedeemVoucherResponse();

  @override
  void onInit() {
    super.onInit();

    voucherService = VoucherService();
    getCurrentVoucher();
  }



  void validateForm() {

  }


  String getVoucherDuration(String? startDate, String? endDate) {
    final start = DateTime.parse(startDate.toString());
    final end = DateTime.parse(endDate.toString());
    final duration = end.difference(start);
    return '${duration.inDays}';
  }

  Future<void> getCurrentVoucher () async {
    try{
      isLoading(true);
      final response = await voucherService.getVoucher();

      print("CHECK RESPONSE");
      print(response.data);

      voucherResponse = VoucherResponse.fromJson(response.data);
      voucherList = voucherResponse.data!;

      print(voucherList);

    } catch (e) {
      Get.snackbar("Get failed", "Failed to get voucher: $e");
      print("Error getting voucher: $e");
    } finally {
      isLoading(false);
    }
  }

  Future redeemVoucher(String voucherCode) async {
    try {
      isLoading(true);


      final response = await voucherService.redeemVoucher(
          voucherCode
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('voucherCode', voucherCode);

      print("Server response:");
      print(response.data);

      redeemVoucherResponse = RedeemVoucherResponse.fromJson(response.data);
      if (redeemVoucherResponse.data != null) {
        if (redeemVoucherResponse.data!.isRedeemed == true) {
          Get.snackbar("Failed", "Voucher code has already been used, please choose another one");
        } else {
          redeemedVoucherCode = voucherCode;
          // voucherDiscount = redeemVoucherResponse.data!.discount;
          // prefs.setInt('voucherDiscount', voucherDiscount);
          Get.snackbar("Success", "Voucher redeemed successfully");
        }
      } else {
        Get.snackbar("Failed", "Failed to redeem voucher");
      }

      voucherCode = redeemVoucherResponse.data.toString();
      print("Parsed code:");
      print(voucherCode);

      Get.snackbar("Success", "Voucher redeemed successfully");
      Get.toNamed(Routes.CART_PAGE, arguments: {"voucherCode": voucherCode});

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }


}