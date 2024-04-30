import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/cart_page/cart_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/detail_page/detail_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/edit_profile_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/reset/reset_password_binding.dart';
import 'package:ayamku_delivery/app/pages/features/edit_profile_page/reset/reset_password_view.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/empty_favourite_page.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/empty_notification_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/payment_page/payment_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_view.dart';
import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/notification_page_binding.dart';
import 'package:ayamku_delivery/app/pages/features/favourite_page/favourite_page_binding.dart';
import 'package:get/get.dart';
import '../pages/features/home_page/bottom_navigation.dart';
import '../pages/features/home_page/home_page_binding.dart';
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

  static const INITIAL = Routes.PILIH_POS_PAGE ;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => BottomNavigation(),
      bindings:  [
        HomePageBinding(),
        // OrderPageBinding(),
        // FavoritePageBinding(),
        ProfilePageBinding()
        //Ganti Binding sesuai sama page navbar masing masing
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
      name: _Paths.EDIT_PROFILE_PAGE,
      page: () => const EditProfilePageView(),
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
      name: _Paths.EMPTY_NOTIFICATION_PAGE,
      page: () => const EmptyNotificationPageView(),
      binding: NotificationPageBinding(),
      transition: Transition.noTransition,
      ),
    GetPage(
      name: _Paths.EMPTY_FAVOURITE_PAGE,
      page: () => const EmptyFavouritePageView(),
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
  ];
} 