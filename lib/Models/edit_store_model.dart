class EditStoreModel {
  bool success;
  Data data;
  String message;

  EditStoreModel({this.success, this.data, this.message});

  EditStoreModel.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  String phone;
  String address;
  String image;
  int views;
  String active;
  int userId;
  String createdAt;
  String updatedAt;
  bool favorite;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.image,
      this.views,
      this.active,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.favorite});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    views = json['views'];
    active = json['active'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    data['views'] = this.views;
    data['active'] = this.active;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['favorite'] = this.favorite;
    return data;
  }
}
