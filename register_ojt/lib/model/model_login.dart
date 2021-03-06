import 'dart:convert';

ModelLogin loginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String loginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    this.name,
    this.code,
    this.token,
    this.role,
    this.companyName,
    this.isPassCriteria,
  });

  String? name;
  String? code;
  String? token;
  String? companyName;
  int? role;
  bool? isPassCriteria;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        name: json["name"],
        code: json["code"],
        token: json["token"],
        role: json["role"],
        companyName: json["companyName"],
        isPassCriteria: json["isPassCriteria"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "token": token,
        "role": role,
        "companyName": companyName,
        "isPassCriteria": isPassCriteria,
      };
}
