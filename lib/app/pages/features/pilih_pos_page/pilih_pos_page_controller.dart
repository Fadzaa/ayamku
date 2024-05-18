import 'package:get/get.dart';

class PilihPosPageController extends GetxController {

  RxString dropdownValueKelas = "10".obs;
  RxString dropdownValueJurusan = "PPLG".obs;

  void onChangeKelas(String selectedKelas, List<String> items) {
    dropdownValueKelas.value = selectedKelas;
    items.remove(selectedKelas);
    items.insert(0, selectedKelas);
  }

  void onChangeJurusan(String selectedJurusan, List<String> items) {
    dropdownValueJurusan.value = selectedJurusan;
    items.remove(selectedJurusan);
    items.insert(0, selectedJurusan);
  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}