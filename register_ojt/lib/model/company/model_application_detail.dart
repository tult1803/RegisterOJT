import 'dart:convert';

ApplicationDetail appDetailFromJson(String str) =>
    ApplicationDetail.fromJson(json.decode(str));

String appDetailToJson(ApplicationDetail data) => json.encode(data.toJson());

class ApplicationDetail {
  ApplicationDetail({
    this.id,
    this.studentCode,
    this.studentName,
    this.position,
    this.gpa,
    this.email,
    this.cv,
  });

  int? id;
  double? gpa;
  String? studentCode;
  String? studentName;
  String? position;
  String? email;
  String? cv;

  factory ApplicationDetail.fromJson(Map<String, dynamic> json) =>
      ApplicationDetail(
        id: json["id"],
        studentCode: json["studentCode"],
        studentName: json["fullname"],
        gpa: json["gpa"],
        position: json["position"],
        email: json["email"],
        cv: json["cv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentCode": studentCode,
        "fullname": studentName,
        "gpa": gpa,
        "position": position,
        "email": email,
        "cv": cv,
      };
}
