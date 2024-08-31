class PaymentRequest {
  int? amount;
  String? payerEmail;
  String? pickupTime;
  String? note;
  int? userId;
  int? cartId;
  int? postsId;
  String? methodType;
  int? userVoucherId;

  PaymentRequest(
      {this.amount,
        this.payerEmail,
        this.pickupTime,
        this.note,
        this.userId,
        this.cartId,
        this.postsId,
        this.methodType,
        this.userVoucherId});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    payerEmail = json['payer_email'];
    pickupTime = json['pickup_time'];
    note = json['note'];
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
    data['pickup_time'] = this.payerEmail;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['cart_id'] = this.cartId;
    data['posts_id'] = this.postsId;
    data['method_type'] = this.methodType;
    data['user_voucher_id'] = this.userVoucherId;
    return data;
  }
}
