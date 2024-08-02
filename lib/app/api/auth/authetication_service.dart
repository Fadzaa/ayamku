import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            'name': name,
            'email': email,
            'password': password,
          });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> otpVerification(String email) async {
    try {
      final response =  await _dioInstance.postRequest(
        endpoint: ApiEndPoint.otp,
        data: {
          'email': email,
        },
      );

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

  Future<Response> updateUser(String name, String email, String phone,String profile,) async {
    try {
      final response = await _dioInstance.putImageRequest(
          endpoint: ApiEndPoint.user,
          isAuthorize: true,
          data: {
            'name': name,
            'email': email,
            'phone_number': phone,
            'profile_picture':profile
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updatePassword(FormData formData) async {

    try {
      final response = await _dioInstance.putRequest(
          endpoint: ApiEndPoint.updatePass,
          isAuthorize: true,
          data: formData
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}