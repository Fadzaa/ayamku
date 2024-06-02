class ApiEndPoint {
  static String baseUrl = 'http://10.0.2.2:8000/api';
  static String baseUrlAuth = '$baseUrl/users';

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
  static String activePromo =  '$baseUrl/promos/active';
}