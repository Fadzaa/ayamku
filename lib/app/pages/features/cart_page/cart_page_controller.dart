import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPageController extends GetxController{

  RxBool isLoading = false.obs;

  RxList<Food> food = food_data;
  RxString dropdownValue = "Pedas".obs;
  int quantityCount = 1;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  //store cart
  // List<Cart> carts = <Cart>[];
  List<CartItems> carts = <CartItems>[];
  CartService cartService = CartService();
  CartsResponse cartsResponse = CartsResponse();


  @override
  void onInit() {
    super.onInit();

    cartService = CartService();
    getCart();
  }

  Future getCart() async {
    try {
      isLoading(true);
      final response = await cartService.getCart();
      print("Server response:");
      print(response.data);

      cartsResponse = CartsResponse.fromJson(response.data);
      carts = cartsResponse.cart!.cartItems!;
      print("Parsed carts:");
      print(carts);

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void onChangeDropdown(String selectedLevel, List<String> items) {
    dropdownValue.value = selectedLevel;
    items.remove(selectedLevel);
    items.insert(0, selectedLevel);
  }

  void decrementQuantity(Food item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
    // else {
    //   cartItems.remove(item);
    // }
  }

  void incrementQuantity(Food item) {
    item.quantity++;
  }

  String formatPrice(double price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

  String get totalPrice {
    double total = 0;
    for (var item in carts) {
      total += double.parse(item.totalPrice!);
    }
    return formatPrice(total);
  }

  @override
  void dispose() {
    super.dispose();
  }
}