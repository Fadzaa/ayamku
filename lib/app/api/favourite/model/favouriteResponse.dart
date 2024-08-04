class FavouriteResponse {
  String? status;
  String? user;
  List<Data>? data;

  FavouriteResponse({this.status, this.user, this.data});

  FavouriteResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user'] = this.user;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  int? price;
  String? rating;
  String? image;
  String? category;
  int? totalRating;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.rating,
        this.image,
        this.category,
        this.totalRating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
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
    data['rating'] = this.rating;
    data['image'] = this.image;
    data['category'] = this.category;
    data['total_rating'] = this.totalRating;
    return data;
  }
}
