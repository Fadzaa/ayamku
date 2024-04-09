import 'package:get/get.dart';
import 'package:ayamku_delivery/app/pages/features/notification_page/notification_page_controller.dart';

class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<notificationPageController>(() => notificationPageController());
  }
}