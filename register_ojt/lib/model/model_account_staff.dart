import 'dart:convert';

List<CompanyAccount> companyAccountFromJson(str) => List<CompanyAccount>.from(
    json.decode(str).map((x) => CompanyAccount.fromJson(x)));

String companyAccountToJson(List<CompanyAccount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyAccount {
  CompanyAccount({
    this.username,
    this.fullname,
    this.email,
    this.companyCode,
  });

  String? username;
  String? fullname;
  String? email;
  String? companyCode;

  factory CompanyAccount.fromJson(Map<String, dynamic> json) => CompanyAccount(
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        companyCode: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "email": email,
        "code": companyCode,
      };
}
