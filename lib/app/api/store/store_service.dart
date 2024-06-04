import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class StoreService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getStore() async {
    try {
      final response = await _dioInstance.getStore(
        endpoint: ApiEndPoint.store,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}