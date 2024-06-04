class Store {
  int? storeStatus;
  String? description;

  Store({this.storeStatus, this.description});

  Store.fromJson(Map<String, dynamic> json) {
    storeStatus = json['store_status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_status'] = this.storeStatus;
    data['description'] = this.description;
    return data;
  }
}
