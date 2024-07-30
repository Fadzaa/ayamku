  class FavouriteResponse {
    int? id;
    FavouriteItems? data;

    FavouriteResponse({this.id, this.data});

    FavouriteResponse.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      data =
          json['product'] != null ? new FavouriteItems.fromJson(json['product']) : null;
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      if (this.data != null) {
        data['product'] = this.data!.toJson();
      }
      return data;
    }
  }

  class FavouriteItems {
    int? id;
    String? name;
    String? description;
    String? price;
    String? rating;
    String? image;
    String? category;
    int? totalRating;

    FavouriteItems(
        {this.id,
        this.name,
        this.description,
        this.price,
        this.rating,
        this.image,
        this.category,
        this.totalRating});

    FavouriteItems.fromJson(Map<String, dynamic> json) {
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