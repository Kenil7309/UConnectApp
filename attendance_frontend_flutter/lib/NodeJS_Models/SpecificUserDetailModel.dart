class SpecificUserModel {
  int? status;
  String? message;
  Data? data;

  SpecificUserModel({this.status, this.message, this.data});

  SpecificUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  GetSpecificUser? getSpecificUser;

  Data({this.getSpecificUser});

  Data.fromJson(Map<String, dynamic> json) {
    getSpecificUser = json['GetSpecificUser'] != null
        ? new GetSpecificUser.fromJson(json['GetSpecificUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getSpecificUser != null) {
      data['GetSpecificUser'] = this.getSpecificUser!.toJson();
    }
    return data;
  }
}

class GetSpecificUser {
  String? sId;
  String? employeeID;
  String? employeeName;
  int? mobileNo;
  String? email;
  String? password;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetSpecificUser(
      {this.sId,
        this.employeeID,
        this.employeeName,
        this.mobileNo,
        this.email,
        this.password,
        this.isAdmin,
        this.createdAt,
        this.updatedAt,
        this.iV});

  GetSpecificUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employeeID = json['EmployeeID'];
    employeeName = json['EmployeeName'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['EmployeeID'] = this.employeeID;
    data['EmployeeName'] = this.employeeName;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isAdmin'] = this.isAdmin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
