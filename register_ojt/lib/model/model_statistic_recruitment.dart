import 'dart:convert';

List<StatisticRecruitment> statisticRecruitmentFromJson(str) =>
    List<StatisticRecruitment>.from(
        json.decode(str).map((x) => StatisticRecruitment.fromJson(x)));

String statisticRecruitmentToJson(List<StatisticRecruitment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatisticRecruitment {
  StatisticRecruitment(
      {this.content,
      this.deadline,
      this.salary,
      this.companyName,
      this.majorName,
      this.topic,
      this.area});

  String? content;
  String? deadline;
  String? salary;
  String? companyName;
  String? majorName;
  String? topic;
  String? area;

  factory StatisticRecruitment.fromJson(Map<String, dynamic> json) =>
      StatisticRecruitment(
        content: json["content"],
        deadline: json["deadline"],
        salary: json["salary"],
        companyName: json["companyName"],
        majorName: json["majorName"],
        topic: json["topic"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "deadline": deadline,
        "salary": salary,
        "companyName": companyName,
        "majorName": majorName,
        "topic": topic,
        "area": area,
      };
}
