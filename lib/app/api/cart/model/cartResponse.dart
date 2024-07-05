class CartsResponse {
  Cart? data;

  CartsResponse({this.data});

  CartsResponse.fromJson(Map<String, dynamic> json) {
    data = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['cart'] = this.data!.toJson();
    }
    return data;
  }
}

class Cart {
  int? id;
  int? userId;
  double? totalPrice;
  List<CartItems>? cartItems;

  Cart({this.id, this.userId, this.totalPrice, this.cartItems});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['total_price'] = this.totalPrice;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? productId;
  String? productName;
  int? quantity;
  String? price;
  double? totalPrice;

  CartItems(
      {this.id,
        this.productId,
        this.productName,
        this.quantity,
        this.price,
        this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    price = json['price'];
    // totalPrice = (json['total_price'] as num).toDouble();
    totalPrice = json['total_price'] is int
        ? (json['total_price'] as int).toDouble()
        : json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
