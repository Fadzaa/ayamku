class Food {
  final int id, price;
  int quantity;
  final double rating;
  final String image, name, description;

  Food({
    required this.id,
    required this.price,
    required this.rating,
    required this.image,
    required this.name,
    required this.description,
    this.quantity = 0,
  });
}
