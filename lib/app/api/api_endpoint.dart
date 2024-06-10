class ApiEndPoint {
  // static String baseUrl = 'http://127.0.0.1:8000/api';
  static String baseUrl = 'http://ayamku-api.rplrus.com/api';
  // static String baseUrl = 'http://10.0.2.2/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Store
  static String store = '$baseUrl/store-status';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';
  static String user = '$baseUrlAuth';

  //Product
  static String productTerlaris = '$baseUrl/products/terlaris';
  static String productCategory = '$baseUrl/products';
  static String productSearch = '$baseUrl/products';

  //promo
  static String activePromo =  '$baseUrl/promos';
}