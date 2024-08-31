import 'package:ayamku_delivery/app/api/auth/model/userResponse.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_controller.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/checkout_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/checkout_page/webview.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/detail_order_page/detail_order_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/reset/reset_password_binding.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/reset/reset_password_view.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/notification_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/order-page/order_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/succes_transaction_binding.dart';
import 'package:ayamku_delivery/app/pages/features/succes_transaction_page/success_transaction_page.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/notification_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_binding.dart';
import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_view.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/review_order_page/review_order_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/review_order_page/review_order_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/see_review_page/see_review_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/see_review_page/see_review_page_view.dart';
import 'package:ayamku_delivery/app/pages/initial_pages/verification_page/verification_page_binding.dart';
import 'package:ayamku_delivery/app/pages/initial_pages/verification_page/verification_page_view.dart';
import 'package:get/get.dart';
import '../pages/features/add_input_voucher/add_input_voucher_binding.dart';
import '../pages/features/add_input_voucher/add_input_voucher_code.dart';
import '../pages/features/home_page/bottom_navigation.dart';
import '../pages/features/home_page/home_page_binding.dart';
import '../pages/features/input_voucher/input_voucher_page.dart';
import '../pages/features/input_voucher/input_voucher_page_binding.dart';
import '../pages/initial_pages/login_page/login_page_binding.dart';
import '../pages/initial_pages/login_page/login_page_view.dart';
import '../pages/initial_pages/onboarding_page/onboarding_page_binding.dart';
import '../pages/initial_pages/onboarding_page/onboarding_page_view.dart';
import '../pages/initial_pages/register_page/register_page_binding.dart';
import '../pages/initial_pages/register_page/register_page_view.dart';
import '../pages/initial_pages/splash_screen/splash_page_binding.dart';
import '../pages/initial_pages/splash_screen/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => BottomNavigation(),
      bindings:  [
        HomePageBinding(),
        OrderPageBinding(),
        // FavouritePageBinding(),
        ProfilePageBinding()
      ],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ONBOARDING_PAGE,
      page: () => const OnboardingPageView(),
      binding: OnboardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.VERIFICATION_PAGE,
      page: () => const VerificationPageView(),
      binding: VerificationPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_PAGE,
      page: () => EditProfilePageView(),
      binding: EditProfilePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_PAGE,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.NOTIFICATION_PAGE,
      page: () => const NotificationPageView(),
      binding: NotificationPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.FAVOURITE_PAGE,
      page: () =>  FavouritePageView(),
      binding: FavouritePageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.PAYMENT_PAGE,
      page: () => const PaymentPageView(),
      binding: PaymentPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.DETAIL_PAGE,
      page: () => const DetailPageView(),
      binding: DetailPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.PILIH_POS_PAGE,
      page: () => const PilihPosPageView(),
      binding: PilihPosPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.CHECKOUT_PAGE,
      page: () => const CheckoutPageView(),
      binding: CheckoutPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.ORDER_PAGE,
      page: () => const OrderPageView(),
      binding: OrderPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.DETAIL_ORDER_PAGE,
      page: () => DetailOrderPageView(),
      transition: Transition.noTransition,
      binding: DetailOrderPageBinding(),
      ),
    GetPage(
      name: _Paths.LIST_MAKANAN_PAGE,
      page: () => const ListMakananView(),
      binding: ListMakananBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.INPUT_VOUCHER_PAGE,
      page: () => const InputVoucherPageView(),
      binding: InputVoucherPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.ADD_INPUT_VOUCHER_PAGE,
      page: () => const InputAddVoucherPageView(),
      binding: InputAddVoucherPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REVIEW_PAGE,
      page: () => const ReviewOrderPageView(),
      binding: ReviewOrderPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SEE_REVIEW_PAGE,
      page: () => const SeeReviewPageView(),
      binding: SeeReviewPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHECKOUT_WEBVIEW,
      page: () => const WebView(),
      binding: CheckoutPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SUCCESS_CHECKOUT,
      page: () => const SuccessTransactionPage(),
      binding: SuccesTransactionBinding(),
      transition: Transition.noTransition,
    ),
  ];
} 