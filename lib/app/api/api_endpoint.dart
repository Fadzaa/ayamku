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
  static String otp = '$baseUrlAuth/otp';

  //Product
  static String productTerlaris = '$baseUrl/products/terlaris';
  static String productCategory = '$baseUrl/products';
  static String productSearch = '$baseUrl/products';

  //promo
  static String activePromo =  '$baseUrl/promos';

  //cart
  static String cart =  '$baseUrl/carts';

  //order
  static String order =  '$baseUrl/orders/show';
  static String storeOrder =  '$baseUrl/orders';

  //redeem voucher
  static String redeemVoucher =  '$baseUrl/vouchers/redeem';
  static String curentUserVoucher =  '$baseUrl/vouchers/show';
}