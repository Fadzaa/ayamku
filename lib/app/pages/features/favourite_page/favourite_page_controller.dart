import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../api/favourite/favourite_service.dart';
import '../../../api/favourite/model/favouriteResponse.dart';

class FavouritePageController extends GetxController {
  var item = FavouriteItems().obs;
  RxBool isLoading = false.obs;
  List<FavouriteItems> favouriteItems = <FavouriteItems>[].obs;

  FavouriteService favouriteService = FavouriteService();
  FavouriteResponse favouriteResponse = FavouriteResponse();


  @override
  void onInit() {
    super.onInit();
    getFavourite();
  }

  Future<void> getFavourite() async {
    try {
      isLoading.value = true;

      final response = await favouriteService.getFavourite();

      if (response.statusCode == 200) {
        List<FavouriteItems> items = (response.data['data'] as List)
            .map((item) => FavouriteItems.fromJson(item))
            .toList();
        favouriteItems.assignAll(items);
      }

    } catch (e) {
      print('Error fetching favourites: $e');
    } finally {
      isLoading.value = false;
    }
  }

    Future<void> addFavourite(int productId) async {
    try {
      isLoading.value = true;
      
      Map<String, dynamic> data = {
        'product_id': productId,
      };

      final response = await favouriteService.addFavourite(data);
      // favouriteResponse = FavouriteResponse.fromJson(response.data);

      await favouriteService.addFavourite(data);

      print(response.data);

      // Show success message
      Get.snackbar(
        "Success",
        "Item added to favorites",
        snackPosition: SnackPosition.TOP,
      );

      update();
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        "Failed to add item to favorites",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteFavourite(int itemId) async {
    isLoading.value = true;
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'product_id': itemId.toString(),
      });
      final response = await favouriteService.deleteFavourite(formData);
      if (response.statusCode == 200) {
        await getFavourite();
      } else {
        print('Error deleting favourite: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error deleting favourite: $e');
    } finally {
      isLoading.value = false;
    }
  }

}