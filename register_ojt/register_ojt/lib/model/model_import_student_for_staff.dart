import 'dart:convert';

import 'dart:html';

List<ImportStudentForStaff> listImportForStaffFromJson(str) => List<ImportStudentForStaff>.from(json.decode(str).map((x) => ImportStudentForStaff.fromJson(x)));

String listImportForStaffToJson(List<ImportStudentForStaff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ImportStudentForStaff {
  ImportStudentForStaff({
    this.phone,
    this.birthday,
    this.term,
    this.credit,
    this.gpa,
    this.majorName,
    this.studentCode,
    this.email,
    this.fullname,
    this.gender
  });

  String? phone;
  DateTime? birthday;
  int? term;
  int? credit;
  double? gpa;
  String? majorName;
  String? studentCode;
  String? email;
  String? fullname;
  String? gender;

  factory ImportStudentForStaff.fromJson(Map<String, dynamic> json) => ImportStudentForStaff(
    phone: json["phone"],
    birthday: DateTime.parse(json["birthday"]),
    term: json["term"],
    credit: json["credit"],
    gpa: json["gpa"],
    majorName: json["majorName"],
    studentCode: json["studentCode"],
    email: json["email"],
    fullname: json["fullname"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "birthday": birthday?.toIso8601String(),
    "term": term,
    "credit": credit,
    "gpa": gpa,
    "majorName": majorName,
    "studentCode": studentCode,
    "email": email,
    "fullname": fullname,
    "gender": gender,
  };
}
