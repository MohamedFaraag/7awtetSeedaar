class UpdatePass {
  bool success;
  List<Data> data;
  String message;

  UpdatePass({this.success, this.data, this.message});

  UpdatePass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String name;
  String phone;
  Null phoneVerified;
  String role;
  String email;
  Null emailVerifiedAt;
  Null rememberToken;
  String createdAt;
  String updatedAt;
  String token;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.phoneVerified,
      this.role,
      this.email,
      this.emailVerifiedAt,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    role = json['role'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone_verified'] = this.phoneVerified;
    data['role'] = this.role;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
