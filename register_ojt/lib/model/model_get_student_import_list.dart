import 'dart:convert';

import 'dart:html';

List<ModelGetStudentImportList> getStudentImportListFromJson(str) => List<ModelGetStudentImportList>.from(json.decode(str).map((x) => ModelGetStudentImportList.fromJson(x)));

String getStudentImportListToJson(List<ModelGetStudentImportList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ModelGetStudentImportList {
  ModelGetStudentImportList({
    this.id,
    this.phone,
    this.birthday,
    this.term,
    this.credit,
    this.gpa,
    this.studentCode,
    this.email,
    this.fullname,
    this.gender,
    this.workingStatus
  });

  int? id;
  String? phone;
  DateTime? birthday;
  int? term;
  int? credit;
  double? gpa;
  String? studentCode;
  String? email;
  String? fullname;
  String? gender;
  String? workingStatus;

  factory ModelGetStudentImportList.fromJson(Map<String, dynamic> json) => ModelGetStudentImportList(
    id: json["id"],
    phone: json["phone"],
    birthday: DateTime.parse(json["birthday"]),
    term: json["term"],
    credit: json["credit"],
    gpa: json["gpa"],
    studentCode: json["studentCode"],
    email: json["email"],
    fullname: json["fullname"],
    gender: json["gender"],
    workingStatus: json["workingStatus"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "birthday": birthday?.toIso8601String(),
    "term": term,
    "credit": credit,
    "gpa": gpa,
    "studentCode": studentCode,
    "email": email,
    "fullname": fullname,
    "gender": gender,
    "workingStatus": workingStatus
  };
}
