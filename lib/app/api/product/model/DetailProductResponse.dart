class DetailProductResponse {
  DetailProduct? data;

  DetailProductResponse({this.data});

  DetailProductResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DetailProduct.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DetailProduct {
  int? id;
  String? name;
  String? description;
  String? price;
  String? rating;
  int? stock;
  String? image;
  String? category;
  int? totalRating;

  DetailProduct(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.rating,
      this.stock,
      this.image,
      this.category,
      this.totalRating});

  DetailProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    stock = json['stock'];
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
    data['stock'] = this.stock;
    data['image'] = this.image;
    data['category'] = this.category;
    data['total_rating'] = this.totalRating;
    return data;
  }
}
