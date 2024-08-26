class PaymentRequest {
  int? amount;
  String? payerEmail;
  int? userId;
  int? cartId;
  int? postsId;
  String? methodType;
  int? userVoucherId;

  PaymentRequest(
      {this.amount,
        this.payerEmail,
        this.userId,
        this.cartId,
        this.postsId,
        this.methodType,
        this.userVoucherId});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    payerEmail = json['payer_email'];
    userId = json['user_id'];
    cartId = json['cart_id'];
    postsId = json['posts_id'];
    methodType = json['method_type'];
    userVoucherId = json['user_voucher_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['payer_email'] = this.payerEmail;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['posts_id'] = this.postsId;
    data['method_type'] = this.methodType;
    data['user_voucher_id'] = this.userVoucherId;
    return data;
  }
}
