
import 'package:ayamku_delivery/app/pages/features/see_review_page/see_review_page_controller.dart';
import 'package:get/get.dart';

class SeeReviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeReviewPageController>(() => SeeReviewPageController());
  }
}