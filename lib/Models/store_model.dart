class StoreModel {
  bool success;
  List<StoreData> storeData;
  String message;

  StoreModel({this.success, this.storeData, this.message});

  StoreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['storeData'] != null) {
      storeData = new List<StoreData>();
      json['storeData'].forEach((v) {
        storeData.add(new StoreData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.storeData != null) {
      data['storeData'] = this.storeData.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class StoreData {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  StoreData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  StoreData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
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
