import 'package:ayamku_delivery/app/pages/features/profile_page/profile_page_binding.dart';
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

  static const INITIAL = Routes.SPLASH_PAGE;

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
  ];
}