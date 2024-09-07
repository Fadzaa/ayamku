import 'package:ayamku_delivery/app/api/auth/model/user_list_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password, String fcmToken) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {'email': email, 'password': password, 'fcm_token': fcmToken});

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> register(String name, String email, String password) async {
    try {
      final response =
          await _dioInstance.postRequest(endpoint: ApiEndPoint.register, data: {
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
      final response = await _dioInstance.postRequest(
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
      final response = await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout, isAuthorize: true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');

      _dioInstance.dio.options.headers.remove('Authorization');

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> showCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.user, isAuthorize: true);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateUser(FormData formData) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.updateUser, isAuthorize: true, data: formData);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updatePassword(String oldPassword, newPassword) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: ApiEndPoint.updatePass,
        isAuthorize: true,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserListResponse> getAllUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.allUser,
          isAuthorize: true
      );

      return UserListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
