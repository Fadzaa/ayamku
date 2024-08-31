class PaymentResponse {
  Payment? data;

  PaymentResponse({this.data});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Payment.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Payment {
  String? checkoutLink;
  String? externalId;
  String? status;
  String? metadata;
  String? updatedAt;
  String? createdAt;
  int? id;

  Payment(
      {this.checkoutLink,
        this.externalId,
        this.status,
        this.metadata,
        this.updatedAt,
        this.createdAt,
        this.id});

  Payment.fromJson(Map<String, dynamic> json) {
    checkoutLink = json['checkout_link'];
    externalId = json['external_id'];
    status = json['status'];
    metadata = json['metadata'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkout_link'] = this.checkoutLink;
    data['external_id'] = this.externalId;
    data['status'] = this.status;
    data['metadata'] = this.metadata;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
