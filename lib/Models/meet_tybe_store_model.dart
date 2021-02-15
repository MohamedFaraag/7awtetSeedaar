class MeettybesStoreModel {
  bool success;
  MeetTypes meetTypes;
  String message;

  MeettybesStoreModel({this.success, this.meetTypes, this.message});

  MeettybesStoreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    meetTypes = json['meetTypes'] != null
        ? new MeetTypes.fromJson(json['meetTypes'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.meetTypes != null) {
      data['meetTypes'] = this.meetTypes.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class MeetTypes {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  MeetTypes(
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

  MeetTypes.fromJson(Map<String, dynamic> json) {
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
  String image;
  String meetType;
  String slaughterDate;
  int age;
  int storeId;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.image,
      this.meetType,
      this.slaughterDate,
      this.age,
      this.storeId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    meetType = json['meet_type'];
    slaughterDate = json['slaughter_date'];
    age = json['age'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['meet_type'] = this.meetType;
    data['slaughter_date'] = this.slaughterDate;
    data['age'] = this.age;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
