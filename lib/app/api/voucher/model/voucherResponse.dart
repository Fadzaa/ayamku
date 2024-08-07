class VoucherResponse {
  List<VoucherRedeem>? data;

  VoucherResponse({this.data});

  VoucherResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VoucherRedeem>[];
      json['data'].forEach((v) {
        data!.add(VoucherRedeem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoucherRedeem {
  int? id;
  int? used;
  bool? isRedeemed;
  Voucher? voucher;

  VoucherRedeem({this.id, this.used, this.isRedeemed, this.voucher});

  VoucherRedeem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    used = json['used'];
    isRedeemed = json['is_redeemed'];
    voucher = json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['used'] = this.used;
    data['is_redeemed'] = this.isRedeemed;
    if (this.voucher != null) {
      data['voucher'] = this.voucher!.toJson();
    }
    return data;
  }
}

class Voucher {
  int? id;
  String? code;
  int? discount;
  String? description;
  int? qty;
  String? startDate;
  String? endDate;

  Voucher({this.id, this.code, this.discount, this.description, this.qty, this.startDate, this.endDate});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    description = json['description'];
    qty = json['qty'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['qty'] = this.qty;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}