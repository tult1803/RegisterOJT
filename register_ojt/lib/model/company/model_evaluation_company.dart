import 'dart:convert';

Evaluation evaluationFromJson(String str) =>
    Evaluation.fromJson(json.decode(str));

String evaluationToJson(Evaluation data) => json.encode(data.toJson());

class Evaluation {
  Evaluation(
      {this.name,
      this.position,
      this.description,
      this.startDate,
      this.endDate,
      this.mark});

  String? name;
  String? position;
  String? description;
  String? startDate;
  String? endDate;
  double? mark;

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
        name: json["name"],
        position: json["position"],
        description: json["description"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        mark: json["mark"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "position": position,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
        "mark": mark
      };
}
