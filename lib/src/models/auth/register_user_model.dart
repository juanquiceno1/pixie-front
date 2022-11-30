import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmePass,
  });

  String name;
  String lastName;
  String phone;
  String email;
  String password;
  String confirmePass;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        name: json['name'] == null ? '' : json['name'].toString(),
        lastName: json['last_name'] == null ? '' : json['last_name'].toString(),
        phone: json['phone'] == null ? '' : json['phone'].toString(),
        email: json['email'] == null ? '' : json['email'].toString(),
        password: json['password'] == null ? '' : json['password'].toString(),
        confirmePass: json['confirme_password'] == null
            ? ''
            : json['confirme_password'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'last_name': lastName,
        'phone': phone,
        'email': email,
        'password': password,
        'confirme_password': confirmePass
      };
}
