import 'package:dio/dio.dart';
import '../api_endpoint.dart';
import '../dio_instance.dart';

class OrderService{
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getOrder() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.order,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeOrder(FormData formData) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.order,
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
