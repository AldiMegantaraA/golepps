import 'dart:convert';

// LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

// String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.status,
        required this.detail,
    });

    String status;
    Detail detail;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"],
        detail: Detail.fromJson(json["detail"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "detail": detail.toJson(),
    };
}

class Detail {
    Detail({
        required this.username,
        required this.password,
    });

    String username;
    String password;

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    required this.username, 
    required this.password
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(), 
      'password': password.trim(),
    };

    return map;
  }
}