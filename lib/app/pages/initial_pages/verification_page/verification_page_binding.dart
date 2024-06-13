import 'package:ayamku_delivery/app/pages/initial_pages/verification_page/verification_page_controller.dart';
import 'package:get/get.dart';

class VerificationPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationPageController());
  }
}