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
  String redeemedVoucherId = '';
  int voucherDiscount = 0;

  // fetch all voucher
  List<Voucher> voucherList = <Voucher>[];
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


  String getVoucherDuration(String? startDate, String? endDate) {
    if (startDate == null || endDate == null) return '0';
    final start = DateTime.parse(startDate);
    final end = DateTime.parse(endDate);
    final duration = end.difference(start);
    return '${duration.inDays}';
  }

  Future<void> getCurrentVoucher() async {
    try {
      isLoading(true);
      final response = await voucherService.getVoucher();

      print("CHECK RESPONSE");
      print(response.data);

      voucherResponse = VoucherResponse.fromJson(response.data);
      if (voucherResponse.data != null) {
        voucherList = voucherResponse.data!.map((data) => data.voucher).whereType<Voucher>().toList();
      } else {
        voucherList = [];
      }

      print(voucherList);
    } catch (e) {
      Get.snackbar("Get failed", "Failed to get voucher: $e");
      print("Error getting voucher: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> redeemVoucher(String voucherCode) async {
    try {
      isLoading(true);

      final response = await voucherService.redeemVoucher(voucherCode);

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
          int voucherId = redeemVoucherResponse.data!.id!;

          prefs.setInt('redeemedVoucherId', voucherId);
          print('redeemedVoucherId saved: $voucherId');

          Get.snackbar("Success", "Voucher redeemed successfully");
          Get.toNamed(Routes.CART_PAGE, arguments: {
            "voucherId": voucherId,
            "voucherCode": voucherCode
          });
        }
      } else {
        Get.snackbar("Failed", "Failed to redeem voucher");
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }

}