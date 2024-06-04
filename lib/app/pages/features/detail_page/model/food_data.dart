import 'package:ayamku_delivery/app/pages/features/detail_page/model/food.dart';
import 'package:ayamku_delivery/common/constant.dart';
import 'package:get/get.dart';

RxList <Food> food_data = [
  Food(
      id: 1,
      image: exampleFood,
      name: 'PAHE Geprek',
      description: 'Nasi + Ayam Geprek + Teh',
      price: 13000,
      rating: 4.5,
    quantity: 2
  ),
].obs;