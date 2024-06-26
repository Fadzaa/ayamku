import 'package:dio/dio.dart';
import '../api_endpoint.dart';
import '../dio_instance.dart';

class CartService{
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getCart() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.cart,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeCart(FormData formData) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.cart,
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
