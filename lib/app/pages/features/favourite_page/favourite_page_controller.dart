import 'package:ayamku_delivery/app/api/favourite/model/favouriteResponse.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
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
      favoriteStatus.clear();
      for (var item in favouriteItems) {
        favoriteStatus[item.id!] = true;
      }

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
        "Sukses",
        "Item ditambahkan ke favorit",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );

      print("ITEM ADDED TO FAVORITES");



      update();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteFavourite(int idFav, int productId) async {

    try {
      isLoading.value = true;
      final response = await favouriteService.deleteFavourite(idFav);
      favoriteStatus[productId] = false;
      print(response.data);


      Get.snackbar(
        "Sukses",
        "Item berhasil dihapus",
        backgroundColor: greenAlert,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        borderRadius: 30,
        margin: EdgeInsets.all(10),
      );




    } catch (e) {
      print('Error deleting favourite: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
