class NewuserModel {
  bool success;
  Data data;
  String message;

  NewuserModel({this.success, this.data, this.message});

  NewuserModel.fromJson(Map<String, dynamic> json) {
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
  UserData userData;
  String token;

  Data({this.userData, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  String name;
  String phone;
  String updatedAt;
  String createdAt;
  int id;

  UserData({this.name, this.phone, this.updatedAt, this.createdAt, this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
