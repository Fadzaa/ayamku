class RedeemVoucherResponse {
  String? message;
  RedeemVoucher? data;

  RedeemVoucherResponse({this.message, this.data});

  RedeemVoucherResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new RedeemVoucher.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RedeemVoucher {
  int? userId;
  int? voucherId;
  bool? isRedeemed;
  String? updatedAt;
  String? createdAt;
  int? id;

  RedeemVoucher(
      {this.userId,
        this.voucherId,
        this.isRedeemed,
        this.updatedAt,
        this.createdAt,
        this.id});

  RedeemVoucher.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    voucherId = json['voucher_id'];
    isRedeemed = json['is_redeemed'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['voucher_id'] = this.voucherId;
    data['is_redeemed'] = this.isRedeemed;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
