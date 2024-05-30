import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getAllProductTerlaris() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.productTerlaris,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}