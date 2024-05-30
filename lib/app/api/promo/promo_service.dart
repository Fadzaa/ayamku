import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class PromoService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllActivePromo() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.activePromo,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}