import 'package:ayamku_delivery/app/pages/features/list_makanan/list_makanan_controller.dart';
import 'package:get/get.dart';


class ListMakananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMakananController>(() => ListMakananController());
  }
}