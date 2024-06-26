import 'package:get/get.dart';

import '../../../router/app_pages.dart';
import '../onboarding_page/onboarding_page_view.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.ONBOARDING_PAGE);
    });
  }

}