// To parse this JSON data, do
//
//     final applicationStudent = applicationStudentFromJson(jsonString);

import 'dart:convert';

List<ApplicationStudent> applicationStudentFromJson(str) => List<ApplicationStudent>.from(json.decode(str).map((x) => ApplicationStudent.fromJson(x)));

String applicationStudentToJson(List<ApplicationStudent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationStudent {
  ApplicationStudent({
    this.studentCode,
    this.studentName,
    this.companyName,
    this.status,
    this.updateDate,
  });

  String? studentCode;
  String? studentName;
  String? companyName;
  String? status;
  DateTime? updateDate;

  factory ApplicationStudent.fromJson(Map<String, dynamic> json) => ApplicationStudent(
    studentCode: json["studentCode"],
    studentName: json["studentName"],
    companyName: json["companyName"],
    status: json["status"],
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "studentCode": studentCode,
    "studentName": studentName,
    "companyName": companyName,
    "status": status,
    "updateDate": updateDate?.toIso8601String(),
  };
}
