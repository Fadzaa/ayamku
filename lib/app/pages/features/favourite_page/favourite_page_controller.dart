import 'package:ayamku_delivery/app/api/favourite/model/favouriteResponse.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import '../../../api/favourite/favourite_service.dart';

class FavouritePageController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Product> favouriteItems = <Product>[].obs;

  FavouriteService favouriteService = FavouriteService();
  FavouriteResponse favouriteResponse = FavouriteResponse();

  @override
  void onInit() {
    super.onInit();
    getFavourite();
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "000");
  }

  Future<void> getFavourite() async {
    try {
      isLoading.value = true;

      final response = await favouriteService.getFavourite();

      print("Fetch Favourite");
      print(response.data);

      favouriteResponse = FavouriteResponse.fromJson(response.data);
      favouriteItems.assignAll(
          favouriteResponse.data!.map((data) => data.product!).toList());

      print("CHECK CURRENT LIST FAVOURITE ITEMS");
      print(favouriteItems.length);
      print("check id");
    } catch (e) {
      isLoading.value = false;
      print(e);
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
      favouriteResponse = FavouriteResponse.fromJson(response.data);

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
