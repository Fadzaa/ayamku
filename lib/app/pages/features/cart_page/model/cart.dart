class Cart {
  String name;
  int id;
  int price;
  int count;
  int total;
  String image;
  String level;

  Cart(
      {required this.id,
        required this.name,
        required this.price,
        required this.count,
        required this.total,
        required this.image,
        required this.level
      });
}