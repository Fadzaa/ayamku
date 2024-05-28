class ApiEndPoint {
  static String baseUrl = 'http://ayamku-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth';
  static String logout = '$baseUrlAuth/logout';
}