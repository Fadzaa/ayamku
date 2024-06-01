import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {
            'email': email,
            'password': password
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> register(String name, String email, String password) async {
    try {
      final response =  await _dioInstance.postRequest(
          endpoint: ApiEndPoint.register,
          data: {
            'nama_lengkap': name,
            'email': email,
            'password': password,
          });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> logout() async {
    try {
      final response =  await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout,
          isAuthorize: true
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> showCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.user,
          isAuthorize: true
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateUser(String name, String email, String phoneNumber, String image) async {
    try {
      final response = await _dioInstance.putRequest(
          endpoint: ApiEndPoint.user,
          isAuthorize: true,
          data: {
            'name': name,
            'email': email,
            'phone_number': phoneNumber,
            'profile_picture': image,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}