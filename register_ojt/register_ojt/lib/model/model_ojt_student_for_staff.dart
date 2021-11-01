import 'dart:convert';

DetailOJTStudentForStaff detailOjtStudentForStaffFromJson(str) => DetailOJTStudentForStaff.fromJson(json.decode(str));

String detailOjtStudentForStaffToJson(DetailOJTStudentForStaff data) => json.encode(data.toJson());

class DetailOJTStudentForStaff {
  DetailOJTStudentForStaff({
    this.studentCode,
    this.fullname,
    this.majorName,
    this.email,
    this.gpa,
    this.companyName,
    this.cv,
  });

  String? studentCode;
  String? fullname;
  String? majorName;
  String? email;
  double? gpa;
  String? companyName;
  String? cv;

  factory DetailOJTStudentForStaff.fromJson(Map<String, dynamic> json) => DetailOJTStudentForStaff(
    studentCode: json["studentCode"],
    fullname: json["fullname"],
    majorName: json["majorName"],
    email: json["email"],
    gpa: json["gpa"],
    companyName: json["companyName"],
    cv: json["cv"],
  );

  Map<String, dynamic> toJson() => {
    "studentCode": studentCode,
    "fullname": fullname,
    "majorName": majorName,
    "email": email,
    "gpa": gpa,
    "companyName": companyName,
    "cv": cv,
  };
}
