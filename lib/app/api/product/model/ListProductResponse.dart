class ListProductResponse {
  List<Product>? data;

  ListProductResponse({this.data});

  ListProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  int? ratingAvg;
  String? image;
  String? category;
  int? totalRating;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.ratingAvg,
        this.image,
        this.category,
        this.totalRating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    ratingAvg = json['rating_avg'];
    image = json['image'];
    category = json['category'];
    totalRating = json['total_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating_avg'] = this.ratingAvg;
    data['image'] = this.image;
    data['category'] = this.category;
    data['total_rating'] = this.totalRating;
    return data;
  }
}
