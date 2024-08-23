import 'package:ayamku_delivery/app/api/auth/authetication_service.dart';
import 'package:ayamku_delivery/app/api/product/model/ListProductResponse.dart';
import 'package:ayamku_delivery/app/api/product/product_service.dart';
import 'package:ayamku_delivery/app/api/promo/model/activePromoResponse.dart';
import 'package:ayamku_delivery/app/api/promo/promo_service.dart';
import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/api/store/model/storeResponse.dart';
import 'package:ayamku_delivery/app/api/store/store_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {

  late PageController pageController;
  RxInt pageIndex = 0.obs;
  final token = RxString('');

  //user
  late AuthenticationService userService;
  late UserResponse userResponse;
  Data user = Data();

  //product terlaris
  late ProductService productService;
  late ListProductResponse listProductResponse;
  List<Product> listProduct = <Product>[];

  //active promo
  late PromoService promoService;
  late ActivePromo listPromoResponse;
  List<Datum> listPromo = <Datum>[];

  //store
  late StoreService storeService;
  late Store storeResponse;

  RxBool isLoadingProduct = false.obs;
  RxBool isLoadingPromo = false.obs;
  RxBool isLoadingStore = false.obs;

  RxInt? storeStatus = 1.obs;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    productService = ProductService();
    promoService = PromoService();
    userService = AuthenticationService();
    storeService = StoreService();

    getCurrentUser();
    getAllProductTerlaris();
    getAllActivePromo();
    getStore();
    fetchToken();
  }



  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
  }


  Future<void> getStore() async {
    try {
      isLoadingStore.value = true;

      final response = await storeService.getStore();
      Store store = Store.fromJson(response.data);
      print("Store status: ${store.storeStatus}");
      print("Description: ${store.description}");

      storeStatus?.value = store.storeStatus ?? 1;
      if (store.storeStatus == 0) {
        print("Toko sedang tutup");
      } else if (store.storeStatus == 1 ){
        print("Toko sedang buka");
      }

    } catch (e) {
      Get.snackbar("Get failed", "Failed to get store: $e");
      print("Error getting store: $e");
    } finally {
      isLoadingStore.value = false;
    }
  }

  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

  Future<void> getAllProductTerlaris() async {
    try {
      isLoadingProduct.value = true;
      final response = await productService.getAllProductTerlaris();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      listProductResponse = ListProductResponse.fromJson(response.data);
      listProduct = listProductResponse.data!;

      print(listProduct);


    } catch (e) {
      isLoadingProduct.value = false;
      print(e);
    } finally {
      isLoadingProduct.value = false;
    }
  }

  Future<void> getAllActivePromo() async {
    try {
      isLoadingPromo.value = true;
      final response = await promoService.getAllActivePromo();

      print("CHECK RESPONSE");
      print(response.data);

      listPromoResponse = ActivePromo.fromJson(response.data);
      listPromo = listPromoResponse.data!;

      print(listPromo);


    } catch (e) {
      isLoadingPromo.value = false;
      print(e);
    } finally {
      isLoadingPromo.value = false;
    }
  }

  Future<void> getCurrentUser() async {
    try {
      // isLoading(true);
      final response = await userService.showCurrentUser();

      print("CHECK CURRENT RESPONSE");
      print(response.data!);
      print(user);

      userResponse = UserResponse.fromJson(response.data);
      user = userResponse.data!;

      print(user);


    } catch (e) {
      // isLoading(true);
      print(e);
    } finally {
      // isLoading(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

}