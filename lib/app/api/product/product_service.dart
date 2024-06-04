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

  Future<Response> getProductCategory({required String category}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.productCategory,
          isAuthorize: true,
          queryParameters: {
            'category': category
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductSearch({required String category, required String search}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.productSearch,
          isAuthorize: true,
          queryParameters: {
            'search': search,
            'category': category
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getDetailProduct(String id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: "http://ayamku-api.rplrus.com/api/products/$id",
          
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}