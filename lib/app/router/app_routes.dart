part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_PAGE = _Paths.SPLASH_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const ONBOARDING_PAGE = _Paths.ONBOARDING_PAGE;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const REGISTER_PAGE = _Paths.REGISTER_PAGE;
  static const EDIT_PROFILE_PAGE = _Paths.EDIT_PROFILE_PAGE;
  static const RESET_PASSWORD_PAGE = _Paths.RESET_PASSWORD_PAGE;
  static const EMPTY_NOTIFICATION_PAGE = _Paths.EMPTY_NOTIFICATION_PAGE;
  static const EMPTY_FAVOURITE_PAGE = _Paths.EMPTY_FAVOURITE_PAGE;
  static const PAYMENT_PAGE = _Paths.PAYMENT_PAGE;
  static const DETAIL_PAGE = _Paths.DETAIL_PAGE;
  static const CART_PAGE = _Paths.CART_PAGE;

}

abstract class _Paths {
  _Paths._();
  static const SPLASH_PAGE = '/';
  static const HOME_PAGE = '/home-page';
  static const ONBOARDING_PAGE = '/onboarding-page';
  static const LOGIN_PAGE = '/login-page';
  static const REGISTER_PAGE = '/register-page';
  static const EDIT_PROFILE_PAGE = '/edit-profile-page';
  static const RESET_PASSWORD_PAGE = '/reset-password-page';
  static const EMPTY_NOTIFICATION_PAGE = '/empty-notification-page';
  static const EMPTY_FAVOURITE_PAGE = '/empty-favourite-page';
  static const PAYMENT_PAGE = '/payment-page';
  static const DETAIL_PAGE = '/detail-page';
  static const CART_PAGE = '/cart-page';
}