// To parse this JSON data, do
//
//     final recruiDetail = recruiDetailFromJson(jsonString);

import 'dart:convert';

RecruiDetail recruiDetailFromJson(str) => RecruiDetail.fromJson(json.decode(str));

String recruiDetailToJson(RecruiDetail data) => json.encode(data.toJson());

class RecruiDetail {
  RecruiDetail({
    this.id,
    this.companyName,
    this.address,
    this.majorName,
    this.companyWebsite,
    this.content,
    this.salary,
    this.position,
    this.deadline,
  });

  int? id;
  String? companyName;
  String? address;
  String? majorName;
  String? companyWebsite;
  String? content;
  String? salary;
  String? position;
  DateTime? deadline;

  factory RecruiDetail.fromJson(Map<String, dynamic> json) => RecruiDetail(
    id: json["id"],
    companyName: json["companyName"],
    address: json["address"],
    majorName: json["majorName"],
    companyWebsite: json["companyWebsite"],
    content: json["content"],
    salary: json["salary"],
    position: json["position"],
    deadline: DateTime.parse(json["deadline"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyName": companyName,
    "address": address,
    "majorName": majorName,
    "companyWebsite": companyWebsite,
    "content": content,
    "salary": salary,
    "position": position,
    "deadline": deadline?.toIso8601String(),
  };
}
