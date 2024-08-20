class ApiEndPoint {
  static String baseUrl = 'https://ayamku-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Store
  static String store = '$baseUrl/store-status';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';
  static String user = '$baseUrlAuth';
  static String updatePass = '$baseUrlAuth/update-password';

  static String otp = '$baseUrlAuth/otp';

  //Product
  static String productTerlaris = '$baseUrl/products/terlaris';
  static String productCategory = '$baseUrl/products';
  static String productSearch = '$baseUrl/products';

  //promo
  static String activePromo =  '$baseUrl/promos';

  //cart
  static String cart =  '$baseUrl/carts';
  static String updateQty =  '$baseUrl/carts/update-qty';

  //favourite
  static String favourite =  '$baseUrl/favourite-foods';
  static String deleteFav(int productId) =>  '$baseUrl/favourite-foods/$productId';

  //order
  static String storeOrder =  '$baseUrl/orders';
  static String order =  '$baseUrl/orders/show';
  static String orderHistory =  '$baseUrl/order-histories/show';
  static String orderStatus = '$baseUrl/orders/update-status';

  //redeem voucher
  static String redeemVoucher =  '$baseUrl/vouchers/redeem';
  static String curentUserVoucher =  '$baseUrl/vouchers/show';

  //review
  static String postReview =  '$baseUrl/reviews';
}