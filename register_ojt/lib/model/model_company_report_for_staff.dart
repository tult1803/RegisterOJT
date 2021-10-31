import 'dart:convert';

List<CompanyReportForStaff> listReportForStaffFromJson(str) => List<CompanyReportForStaff>.from(json.decode(str).map((x) => CompanyReportForStaff.fromJson(x)));

String listReportForStaffToJson(List<CompanyReportForStaff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class CompanyReportForStaff {
  CompanyReportForStaff({
    this.publicDate,
    this.workSortDescription,
    this.studentCode,
    this.mark,
    this.studentName,
  });

  DateTime? publicDate;
  String? workSortDescription;
  String? studentCode;
  double? mark;
  String? studentName;

  factory CompanyReportForStaff.fromJson(Map<String, dynamic> json) => CompanyReportForStaff(
    publicDate: DateTime.parse(json["publicDate"]),
    workSortDescription: json["workSortDescription"],
    studentCode: json["studentCode"],
    mark: json["mark"],
    studentName: json["studentName"],
  );

  Map<String, dynamic> toJson() => {
    "publicDate": publicDate?.toIso8601String(),
    "workSortDescription": workSortDescription,
    "studentCode": studentCode,
    "mark": mark,
    "studentName": studentName,
  };
}
