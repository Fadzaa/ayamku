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

      final response = await voucherService.getVoucher();

      print("Server response:");
      print(response.data);

      voucherResponse = VoucherResponse.fromJson(response.data);
      var voucher = voucherResponse.data?.firstWhere((voucherRedeem) => voucherRedeem.voucher!.code == voucherCode);
      if (voucher != null) {
        if (voucher.used == 1) {
          Get.snackbar("Failed", "Voucher code has already been used, please choose another one");
        } else {
          int voucherId = voucher.id!;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('unusedVoucherId', voucherId);
          prefs.setString('unusedVoucherCode', voucherCode);
          Get.snackbar("Success", "Voucher redeemed successfully");
          Get.toNamed(Routes.CART_PAGE, arguments: {
            "voucherId": voucherId,
            "voucherCode": voucherCode
          });
          print(voucherId);
          print(voucherCode);
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