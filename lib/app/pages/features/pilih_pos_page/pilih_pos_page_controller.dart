  import 'package:get/get.dart';
  import 'package:ayamku_delivery/app/api/pos/model/PostResponse.dart';
  import 'package:ayamku_delivery/app/api/pos/pos_service.dart';
  import 'package:get/get_rx/get_rx.dart';


  class PilihPosPageController extends GetxController {

    RxString dropdownValueKelas = "10".obs;
    RxString dropdownValueJurusan = "PPLG".obs;
    RxBool isLoadingAll = false.obs;
    List<Pos> listPos = <Pos>[];

    PosResponse posResponse = PosResponse();
    PosService posService = PosService();



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

      getAllProduct();

    }

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }

    void getAllProduct () async {
      try {
        isLoadingAll.value = true;

        final response = await posService.allPos();

        print("Fetch Semua Pos");
        print(response.data);

        posResponse = PosResponse.fromJson(response.data);
        listPos = posResponse.data!.obs;

        print("Fetch Semua Pos");
        //print(listProduct);


        print(posResponse.data);
      } catch (e) {
        isLoadingAll.value = true;
        print(e);
      } finally {
        isLoadingAll.value = false;
      }
    }

  }