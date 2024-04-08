import 'package:ayamku_delivery/common/constant.dart';

class Promo {
  final int id;
  final String image;

  Promo({
    required this.id,
    required this.image
  });
}

//sample data
List <Promo> promoList = [
  Promo(id: 1,image: examplePromo),
  Promo(id: 2,image: examplePromo),
  Promo(id: 3,image: examplePromo),
];

