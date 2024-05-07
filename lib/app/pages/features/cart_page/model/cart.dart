class Cart {
  String name;
  int id;
  double price;
  int count;
  double total;
  String image;

  Cart(
      {required this.id,
        required this.name,
        required this.price,
        required this.count,
        required this.total,
        required this.image});
}