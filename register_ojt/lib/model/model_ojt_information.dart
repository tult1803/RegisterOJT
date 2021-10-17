import 'dart:convert';

List<OjtInfomation> ojtInfomationFromJson(str) => List<OjtInfomation>.from(json.decode(str).map((x) => OjtInfomation.fromJson(x)));

String ojtInfomationToJson(List<OjtInfomation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OjtInfomation {
  OjtInfomation({
    this.id,
    this.area,
    this.deadline,
    this.salary,
    this.companyName,
    this.majorName,
    this.topic,
  });

  int? id;
  String? area;
  String? deadline;
  String? salary;
  String? companyName;
  String? majorName;
  String? topic;

  factory OjtInfomation.fromJson(Map<String, dynamic> json) => OjtInfomation(
    id: json["id"],
    area: json["area"],
    deadline: json["deadline"],
    salary: json["salary"],
    companyName: json["companyName"],
    majorName: json["majorName"],
    topic: json["topic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area": area,
    "deadline": deadline,
    "salary": salary,
    "companyName": companyName,
    "majorName": majorName,
    "topic": topic,
  };
}
