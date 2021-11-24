import 'dart:convert';

List<StatisticStudent> statisticStudentFromJson(str) =>
    List<StatisticStudent>.from(
        json.decode(str).map((x) => StatisticStudent.fromJson(x)));

String statisticStudentToJson(List<StatisticStudent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatisticStudent {
  StatisticStudent(
      {this.stuCode,
      this.stuName,
      this.majorName,
      this.email,
      this.phone,
      this.term,
      this.gpa,
      this.companyName,
      this.startDate,
      this.endDate,
      this.workingStatus});

  String? stuCode;
  String? stuName;
  String? majorName;
  String? email;
  String? phone;
  int? term;
  double? gpa;
  String? companyName;
  String? startDate;
  String? endDate;
  String? workingStatus;

  factory StatisticStudent.fromJson(Map<String, dynamic> json) =>
      StatisticStudent(
          stuCode: json["studentCode"],
          stuName: json["fullname"],
          majorName: json["majorName"],
          email: json["email"],
          phone: json["phone"],
          term: json["term"],
          gpa: json["gpa"],
          companyName: json["companyName"],
          startDate: json["startDate"],
          endDate: json["endDate"],
          workingStatus: json["workingStatus"]);

  Map<String, dynamic> toJson() => {
        "studentCode": stuCode,
        "fullname": stuName,
        "majorName": majorName,
        "email": email,
        "phone": phone,
        "term": term,
        "gpa": gpa,
        "companyName": companyName,
        "startDate": startDate,
        "endDate": endDate,
        "workingStatus": workingStatus
      };
}
