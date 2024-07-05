class VoucherResponse {
  List<Data>? data;

  VoucherResponse({this.data});

  VoucherResponse.fromJson(Map<String, dynamic> json) {
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
  String? code;
  int? discount;
  String? description;
  int? qty;
  String? startDate;
  String? endDate;

  Data(
      {this.id,
        this.code,
        this.discount,
        this.description,
        this.qty,
        this.startDate,
        this.endDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    description = json['description'];
    qty = json['qty'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
