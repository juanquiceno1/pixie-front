// To parse this JSON data, do
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json['email'] == null ? '' : json['email'].toString(),
        password: json['password'] == null ? '' : json['password'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
