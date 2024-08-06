class HomeModel {
  bool? status;
  String? message;
  List<UserList>? userList;
  int? currentPage;
  int? lastPage;
  int? total;
  int? perPage;

  HomeModel(
      {this.status,
      this.message,
      this.userList,
      this.currentPage,
      this.lastPage,
      this.total,
      this.perPage});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['userList'] != null) {
      userList = <UserList>[];
      json['userList'].forEach((v) {
        userList!.add(new UserList.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    total = json['total'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userList != null) {
      data['userList'] = userList!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    data['total'] = total;
    data['perPage'] = perPage;
    return data;
  }
}

class UserList {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phoneNo;
  String? status;

  UserList(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.countryCode,
      this.phoneNo,
      this.status});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phoneNo = json['phone_no'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['phone_no'] = phoneNo;
    data['status'] = status;
    return data;
  }
}
