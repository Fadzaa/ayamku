import 'package:get/get.dart';

class PilihPosPageController extends GetxController {

  RxString dropdownValueKelas = "10".obs;
  RxString dropdownValueJurusan = "PPLG".obs;

  void onChangeKelas(String selectedKelas) {
    dropdownValueKelas.value = selectedKelas;
    print("Kelas : $selectedKelas");
  }

  void onChangeJurusan(String selectedJurusan) {
    dropdownValueJurusan.value = selectedJurusan;
    print("Kelas : $selectedJurusan");
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