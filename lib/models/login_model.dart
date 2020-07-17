import 'package:dio/dio.dart';


// class LoginRequest {
//   String email;
//   String password;

//   LoginRequest({this.email, this.password});

//   LoginRequest.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }

//   static Map<dynamic, dynamic> toMap(String email, String password) {
//     final data = Map<dynamic, dynamic>();
//     data['email'] = email;
//     data['password'] = password;
//     return data;
//   }

//   static FormData generateMap(){
//     FormData formData = FormData.fromMap({
//       "email": "sunny009@gmail.com",
//       "password": "qwerty",
//     });

//     return formData;
//   }
// }

class LoginResponse {
  int status;
  User data;
  String message;
  String userMsg;

  LoginResponse({this.status, this.data, this.message, this.userMsg});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['user_msg'] = this.userMsg;
    return data;
  }
}

class User {
  int id;
  int roleId;
  String firstName;
  String lastName;
  String email;
  String username;
  String profilePic;
  String countryId;
  String gender;
  int phoneNo;
  String dob;
  bool isActive;
  String created;
  String modified;
  String accessToken;

  User(
      {this.id,
        this.roleId,
        this.firstName,
        this.lastName,
        this.email,
        this.username,
        this.profilePic,
        this.countryId,
        this.gender,
        this.phoneNo,
        this.dob,
        this.isActive,
        this.created,
        this.modified,
        this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    profilePic = json['profile_pic'];
    countryId = json['country_id'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    isActive = json['is_active'];
    created = json['created'];
    modified = json['modified'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['profile_pic'] = this.profilePic;
    data['country_id'] = this.countryId;
    data['gender'] = this.gender;
    data['phone_no'] = this.phoneNo;
    data['dob'] = this.dob;
    data['is_active'] = this.isActive;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['access_token'] = this.accessToken;
    return data;
  }

}
