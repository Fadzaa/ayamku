class ReviewResponse {
  List<Data>? data;

  ReviewResponse({this.data});

  ReviewResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? userName;
  String? productName;
  int? orderId;
  String? rating;
  String? comment;
  String? createdAt;

  Data(
      {this.id,
        this.userName,
        this.productName,
        this.orderId,
        this.rating,
        this.comment,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    productName = json['product_name'];
    orderId = json['order_id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['product_name'] = this.productName;
    data['order_id'] = this.orderId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    return data;
  }
}
