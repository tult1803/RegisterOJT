import 'dart:convert';

import 'dart:html';

List<ModelStatisticDropButton> getStatisticDropButtonFromJson(str) => List<ModelStatisticDropButton>.from(json.decode(str).map((x) => ModelStatisticDropButton.fromJson(x)));

String getStatisticDropButtonToJson(List<ModelStatisticDropButton> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ModelStatisticDropButton {
  ModelStatisticDropButton({
    this.name,
    this.startDate,
    this.endDate,
  });

  String? name;
  DateTime? startDate;
  DateTime? endDate;

  factory ModelStatisticDropButton.fromJson(Map<String, dynamic> json) => ModelStatisticDropButton(
      name: json["name"],
      startDate: DateTime.parse(json["startDate"]),
      endDate: DateTime.parse(json["endDate"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
  };
}
