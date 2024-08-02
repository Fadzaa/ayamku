import 'dart:async';
import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

class CartPageController extends GetxController{

  RxBool isLoading = false.obs;
  RxInt quantity = RxInt(1);
  RxInt itemPrice = RxInt(0);
  RxList<Food> food = food_data;
  RxString dropdownValue = "Pedas".obs;
  RxDouble totalPrice = 0.0.obs;
  Timer? _debounce;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  //fetch cart
  RxList<CartItems> cartItems = <CartItems>[].obs;
  Cart carts = Cart();
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
      cartItems.assignAll(cartsResponse.data!.cartItems!);
      totalPrice.value = cartsResponse.data!.totalPrice!.toDouble();
      updateTotalPrice();
      print("Parsed carts:");
      print(cartItems);
      print(totalPrice);

      update();

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


  void incrementQuantity(CartItems cartItem) {
    print("Increment quantity called");
    cartItem.quantity = (cartItem.quantity ?? 0) + 1;
    print("Updated quantity: ${cartItem.quantity}");
    updateTotalPrice();
    update();

    _debounce = Timer(Duration(seconds: 5), () {
      updateQty(cartItem);
    });
  }

  void decrementQuantity(CartItems cartItem) {
    print("Decrement quantity called");
    cartItem.quantity = (cartItem.quantity ?? 0) - 1;
    if (cartItem.quantity == 0) {
      updateQty(cartItem);
      Get.snackbar("Message", "Cart item removed successfully");
    } else {
      print("Updated quantity: ${cartItem.quantity}");
      updateTotalPrice();
      update();

      _debounce = Timer(Duration(seconds: 5), () {
        updateQty(cartItem);
      });
    }
  }

  void updateQty(CartItems cartItem) async {
    try {
      isLoading(true);
      final response = await cartService.updateQty(
        cartItem.id.toString(),
        cartItem.quantity ?? 0,
      );
      print("Server response:");
      print(response.data);
      // Update the cart items and total price
      cartsResponse = CartsResponse.fromJson(response.data);
      cartItems.assignAll(cartsResponse.data!.cartItems!);
      totalPrice.value = cartsResponse.data!.totalPrice!.toDouble();
      updateTotalPrice();
      print("Parsed quantity:");
      print(cartItems);
      print(totalPrice);
      update();
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void updateTotalPrice() {
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + ((item.totalPrice ?? 0) * (item.quantity ?? 0)));
  }
  String formatPrice(int price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }


  @override
  void dispose() {
    super.dispose();
  }
}