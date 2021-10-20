import 'dart:convert';

List<ApplicationCompany> applicationCompanyFromJson(str) =>
    List<ApplicationCompany>.from(
        json.decode(str).map((x) => ApplicationCompany.fromJson(x)));

String applicationCompanyToJson(List<ApplicationCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationCompany {
  ApplicationCompany({
    this.studentCode,
    this.studentName,
    this.registrationDate,
    this.position,
    this.status,
  });

  String? studentCode;
  String? studentName;
  DateTime? registrationDate;
  String? position;
  String? status;

  factory ApplicationCompany.fromJson(Map<String, dynamic> json) =>
      ApplicationCompany(
        studentCode: json["studentCode"],
        studentName: json["fullname"],
        position: json["position"],
        status: json["status"],
        registrationDate: DateTime.parse(json["registrationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "studentCode": studentCode,
        "fullname": studentName,
        "position": position,
        "status": status,
        "registrationDate": registrationDate?.toIso8601String(),
      };
}
