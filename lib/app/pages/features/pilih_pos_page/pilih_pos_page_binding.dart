import 'package:ayamku_delivery/app/pages/features/pilih_pos_page/pilih_pos_page_controller.dart';
import 'package:get/get.dart';

class PilihPosPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PilihPosPageController>(() => PilihPosPageController());
  }

}