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
  static const NOTIFICATION_PAGE = _Paths.NOTIFICATION_PAGE;
  static const FAVOURITE_PAGE = _Paths.FAVOURITE_PAGE;
  static const PAYMENT_PAGE = _Paths.PAYMENT_PAGE;
  static const DETAIL_PAGE = _Paths.DETAIL_PAGE;
  static const CART_PAGE = _Paths.CART_PAGE;
  static const PILIH_POS_PAGE = _Paths.PILIH_POS_PAGE;
  static const CHECKOUT_PAGE = _Paths.CHECKOUT_PAGE;
  static const ORDER_PAGE = _Paths.ORDER_PAGE;
  static const DETAIL_ORDER_PAGE = _Paths.DETAIL_ORDER_PAGE;
  static const LIST_MAKANAN_PAGE = _Paths.LIST_MAKANAN_PAGE;
  static const INPUT_VOUCHER_PAGE = _Paths.INPUT_VOUCHER_PAGE;
  static const ADD_INPUT_VOUCHER_PAGE = _Paths.ADD_INPUT_VOUCHER_PAGE;
  static const PROFILE_PAGE = _Paths.PROFILE_PAGE;
  static const VERIFICATION_PAGE = _Paths.VERIFICATION_PAGE;
  static const REVIEW_PAGE = _Paths.REVIEW_PAGE;
  static const SEE_REVIEW_PAGE = _Paths.SEE_REVIEW_PAGE;
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
  static const NOTIFICATION_PAGE = '/empty-notification-page';
  static const FAVOURITE_PAGE = '/empty-favourite-page';
  static const PAYMENT_PAGE = '/payment-page';
  static const DETAIL_PAGE = '/detail-page';
  static const CART_PAGE = '/cart-page';
  static const PILIH_POS_PAGE = '/pilih-pos-page';
  static const CHECKOUT_PAGE = '/checkout-page';
  static const ORDER_PAGE = '/order-page';
  static const DETAIL_ORDER_PAGE = '/detail-order-page';
  static const LIST_MAKANAN_PAGE = '/list-makanan-page'; 
  static const INPUT_VOUCHER_PAGE = '/input-voucher-page';
  static const ADD_INPUT_VOUCHER_PAGE = '/add-input-voucher-page';
  static const PROFILE_PAGE = '/profile-page';
  static const VERIFICATION_PAGE = '/verification-page';
  static const REVIEW_PAGE = '/review-page';
  static const SEE_REVIEW_PAGE = '/see-review-page';
}