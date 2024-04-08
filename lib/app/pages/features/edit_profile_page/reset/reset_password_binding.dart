import 'reset_password_controller.dart';
import 'package:get/get.dart';


class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetController>(() => ResetController());
  }
}