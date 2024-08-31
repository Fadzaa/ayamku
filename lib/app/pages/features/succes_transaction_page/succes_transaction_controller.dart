import 'package:ayamku_delivery/app/api/cart/cart_service.dart';
import 'package:ayamku_delivery/app/api/cart/model/cartResponse.dart';
import 'package:get/get.dart';

class SuccesTransactionController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt totalPrice = RxInt(0);

  //fetch cart
  RxList<CartItems> cartItems = <CartItems>[].obs;
  Cart carts = Cart();
  CartService cartService = CartService();
  CartsResponse cartsResponse = CartsResponse();
  RxList<bool> isLoadingCartItems = List<bool>.filled(0, false).obs;

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
}