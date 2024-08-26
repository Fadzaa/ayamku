import 'dart:async';
import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPageController extends GetxController{

  RxBool isLoading = false.obs;

  RxInt quantity = RxInt(1);
  RxInt itemPrice = RxInt(0);

  RxString dropdownValue = "Pedas".obs;
  RxInt totalPrice = RxInt(0);
  // Timer? _debounce;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  //fetch cart
  RxList<CartItems> cartItems = <CartItems>[].obs;
  Cart carts = Cart();
  CartService cartService = CartService();
  CartsResponse cartsResponse = CartsResponse();
  RxList<bool> isLoadingCartItems = List<bool>.filled(0, false).obs;

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
      cartItems.assignAll(cartsResponse.cart!.cartItems!);
      totalPrice.value = cartsResponse.cart!.totalPrice!;
      print(totalPrice.value);

      print("Parsed carts:");
      print(cartItems);
      print(totalPrice);

      isLoadingCartItems = List<bool>.filled(cartItems.length, false).obs;

      update();

    } catch (e) {
      // print('Error: $e');
      // Get.snackbar("Error", e.toString());
      // print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<String?> getVoucherCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voucherCode = prefs.getString('unusedVoucherCode');
    return voucherCode;
  }


  void onChangeDropdown(String selectedLevel, List<String> items) {
    dropdownValue.value = selectedLevel;
    items.remove(selectedLevel);
    items.insert(0, selectedLevel);
  }


  void incrementQuantity(CartItems cartItem, index) {
    print("Increment quantity called");
    cartItem.quantity = (cartItem.quantity ?? 0) + 1;
    cartItem.totalPrice = cartItem.price! * cartItem.quantity!;
    totalPrice.value = totalPrice.value + cartItem.price!;
    print("Updated quantity: ${cartItem.quantity}");
    update();

    updateQty(cartItem, index);
  }

  void decrementQuantity(CartItems cartItem, index) {
    print("Decrement quantity called");
    cartItem.quantity = (cartItem.quantity ?? 0) - 1;
    cartItem.totalPrice = cartItem.price! * cartItem.quantity!;
    totalPrice.value = totalPrice.value - cartItem.price!;
    if (cartItem.quantity == 0) {
      updateQty(cartItem, index);
      Get.snackbar("Message", "Cart item removed successfully");
    } else {
      print("Updated quantity: ${cartItem.quantity}");
      update();

      updateQty(cartItem, index);
    }
  }

  void updateQty(CartItems cartItem, int index) async {
    try {
      isLoadingCartItems[index] = true;

      await cartService.updateQty(
        cartItem.id.toString(),
        cartItem.quantity ?? 0,
      );

    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", e.toString());
    } finally {
      isLoadingCartItems[index] = false;
    }
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