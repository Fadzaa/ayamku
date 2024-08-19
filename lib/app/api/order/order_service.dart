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
        endpoint: ApiEndPoint.storeOrder,
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getOrderFilterdate( String filter, String date) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.orderHistory,
          isAuthorize: true,
          queryParameters: {
            'filter': filter,
            'date': date
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getOrderFilterLatest( String latest) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.orderHistory,
          isAuthorize: true,
          queryParameters: {
            'filter': latest,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getOrderFilter7days( String days) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.orderHistory,
          isAuthorize: true,
          queryParameters: {
            'filter': days,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateOrderStatus(String id, String status) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: ApiEndPoint.orderStatus,
        isAuthorize: true,
        data: {
          'order_id': id,
          'status': status,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
