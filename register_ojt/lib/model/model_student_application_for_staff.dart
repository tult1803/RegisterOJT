import 'dart:convert';

List<ListStudentForStaff> listStudentFromJson(str) => List<ListStudentForStaff>.from(json.decode(str).map((x) => ListStudentForStaff.fromJson(x)));

String listStudentToJson(List<ListStudentForStaff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ListStudentForStaff {
  ListStudentForStaff({
    this.id,
    this.studentCode,
    this.fullname,
    this.gpa,
    this.companyName,
    this.status,
    this.updateDate,
  });

  int? id;
  String? studentCode;
  String? fullname;
  int? gpa;
  String? companyName;
  String? status;
  DateTime? updateDate;


  factory ListStudentForStaff.fromJson(Map<String, dynamic> json) => ListStudentForStaff(
    id: json["id"],
    studentCode: json["studentCode"],
    fullname: json["fullName"],
    gpa: json["gpa"],
    companyName: json["companyName"],
    status: json["status"],
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studentCode": studentCode,
    "fullName": fullname,
    "gpa": gpa,
    "companyName": companyName,
    "status": status,
    "updateDate": updateDate?.toIso8601String(),
  };
}
