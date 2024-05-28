import 'package:ayamku_delivery/app/pages/features/cart_page/model/cart.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/model/food_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPageController extends GetxController{

  RxList<Food> food = food_data;
  RxString dropdownValue = "Pedas".obs;
  int quantityCount = 1;
  RxList<Cart> cartItems = <Cart>[].obs;
  RxList<String> levelList = ["Pedas", "Tidak pedas", "Sedang"].obs;

  void addItemToCart(Cart cartItem) {
    try {
      int index = cartItems.indexWhere((item) => item.id == cartItem.id);
      if (index != -1) {
        cartItems[index].count += cartItem.count;
        cartItems[index].total = cartItems[index].price * cartItems[index].count;
      } else {
        cartItems.add(cartItem);
      }
      update();
    } catch (e) {
      print('Error adding item to cart: $e');
      rethrow;
    }
  }

  void onChangeDropdown(String selectedLevel, List<String> items) {
    dropdownValue.value = selectedLevel;
    items.remove(selectedLevel);
    items.insert(0, selectedLevel);
  }

  void checkIsProductEmpty() {

  }

  void decrementQuantity(Food item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartItems.remove(item);
    }
  }

  void incrementQuantity(Food item) {
    item.quantity++;
  }



  String formatPrice(double price) {
    var formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price * item.count);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}