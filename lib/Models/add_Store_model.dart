class AddStoremodel {
  bool success;
  Data data;
  String message;

  AddStoremodel({this.success, this.data, this.message});

  AddStoremodel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String name;
  String phone;
  String address;
  String active;
  int userId;
  String updatedAt;
  String createdAt;
  int id;
  bool favorite;

  Data(
      {this.name,
      this.phone,
      this.address,
      this.active,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.favorite});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    active = json['active'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['active'] = this.active;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['favorite'] = this.favorite;
    return data;
  }
}
