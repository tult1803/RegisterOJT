import 'dart:convert';

List<StudentCompany> studentCompanyFromJson(str) => List<StudentCompany>.from(
    json.decode(str).map((x) => StudentCompany.fromJson(x)));

String studentCompanyToJson(List<StudentCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentCompany {
  StudentCompany({
    this.studentCode,
    this.studentName,
    this.startDate,
    this.endDate,
    this.position,
    this.status,
  });

  String? studentCode;
  String? studentName;
  String? startDate;
  String? endDate;
  String? position;
  String? status;

  factory StudentCompany.fromJson(Map<String, dynamic> json) => StudentCompany(
        studentCode: json["studentCode"],
        studentName: json["studentName"],
        position: json["position"],
        status: json["status"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "studentCode": studentCode,
        "studentName": studentName,
        "position": position,
        "status": status,
        "startDate": startDate,
        "endDate": endDate,
      };
}
