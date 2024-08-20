import 'package:ayamku_delivery/app/api/favourite/model/favouriteResponse.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import '../../../api/favourite/favourite_service.dart';

class FavouritePageController extends GetxController {
  RxBool isLoading = false.obs;
  // RxBool isFavourite = false.obs;

  RxMap<int, bool> favoriteStatus = <int, bool>{}.obs;
  bool isProductFavorite(int productId) {
    return favoriteStatus[productId] ?? false;
  }

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
    return formattedPrice.replaceAll(",00", "");
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

      await favouriteService.addFavourite(productId);


      favoriteStatus[productId] = true;

      Get.snackbar(
        "Success",
        "Item added to favorites",
        snackPosition: SnackPosition.TOP,
      );

      print("ITEM ADDED TO FAVORITES");

      update();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteFavourite(int productId) async {
    isLoading.value = true;
    try {
      final response = await favouriteService.deleteFavourite(productId);
      print(response.data);

      Get.snackbar(
        "Success",
        "Item delete to favorites",
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      print('Error deleting favourite: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
