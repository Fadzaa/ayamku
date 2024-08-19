import 'package:dio/dio.dart';

import '../api_endpoint.dart';
import '../dio_instance.dart';

class ReviewService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> postReview(FormData formData) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.postReview,
        isAuthorize: true,
        data: formData,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}