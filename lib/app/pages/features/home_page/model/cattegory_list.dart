import 'package:ayamku_delivery/common/constant.dart';

class Cattegory {
  final int id;
  final String image, text;

  Cattegory({
    required this.id,
    required this.image,
    required this.text
  });
}

//sample data
List <Cattegory> cattegoryList = [
  Cattegory(id: 1,image: ctgGeprek,text: "Geprek"),
  Cattegory(id: 2,image: ctgRicebowl,text: "Ricebowl"),
  Cattegory(id: 3,image: ctgSnack,text: "Snack"),
  Cattegory(id: 4,image: ctgMinuman,text: "Minuman"),
];

