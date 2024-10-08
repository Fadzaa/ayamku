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

    Future<dio.Response> addFavourite(int productId) async {
      try {
        final response = await _dioInstance.postRequest(
          endpoint : ApiEndPoint.favourite,
          data: {
            'product_id': productId,
          },
          isAuthorize: true,
        );
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }

    Future<dio.Response> deleteFavourite(int idFav) async {
      try {
        final response = await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.deleteFav(idFav),
          isAuthorize: true,
        );
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }
  }

