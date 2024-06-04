import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class PosService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> allPos() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: "http://ayamku-api.rplrus.com/api/posts",
          
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> addPos(String name,String description,String images) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: "http://ayamku-api.rplrus.com/api/posts",
          data: {
            'name': name,
            'description': description,
            'image': images
            }
          
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updatePos(String name,String description,String images,String id) async {
    try {
      final response = await _dioInstance.putRequest(
          endpoint: "http://ayamku-api.rplrus.com/api/posts/$id",
          data: {
            'name': name,
            'description': description,
            'image': images
            }
          
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deletePos(String name,String description,String images,String id) async {
    try {
      final response = await _dioInstance.deleteRequest(
          endpoint: "http://ayamku-api.rplrus.com/api/posts/$id",
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}