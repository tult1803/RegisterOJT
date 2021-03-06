import 'dart:convert';

List<Company> companyFromJson(str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  Company({this.id, this.companyName, this.address, this.webSite});

  int? id;
  String? companyName;
  String? address;
  String? webSite;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
      id: json["id"],
      companyName: json["companyName"],
      address: json["address"],
      webSite: json["webSite"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "address": address,
        "webSite": webSite
      };
}
