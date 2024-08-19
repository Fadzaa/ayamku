    import 'package:dio/dio.dart' as dio;
    import '../api_endpoint.dart';
    import '../dio_instance.dart';

    class FavouriteService {
    final DioInstance _dioInstance = DioInstance();

    Future<dio.Response> getFavourite() async {
      try {
        final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.favourite,
          isAuthorize: true,
        );
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }

    Future<dio.Response> addFavourite(Map<String, dynamic> data) async {
      try {
        final response = await _dioInstance.postRequest(
          endpoint : ApiEndPoint.favourite,
          data: data,
          isAuthorize: true,
        );
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }

    Future<dio.Response> deleteFavourite(formData, String id) async {
      try {
        final response = await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.deleteFav(id),
          isAuthorize: true,
        );
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }
  }

