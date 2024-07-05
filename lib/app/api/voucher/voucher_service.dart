import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class VoucherService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> redeemVoucher(String redeemVoucher) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.redeemVoucher,
        isAuthorize: true,
        data: {
          'voucher_code': redeemVoucher,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getVoucher() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.curentUserVoucher,
        isAuthorize: true
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}