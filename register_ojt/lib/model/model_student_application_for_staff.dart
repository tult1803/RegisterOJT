import 'dart:convert';

List<ListStudentForStaff> listStudentForStaffFromJson(str) => List<ListStudentForStaff>.from(json.decode(str).map((x) => ListStudentForStaff.fromJson(x)));

String listStudentForStaffToJson(List<ListStudentForStaff> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ListStudentForStaff ojtStudentForStaffFromJson(str) => ListStudentForStaff.fromJson(json.decode(str));

String OjtStudentForStaffToJson(ListStudentForStaff data) => json.encode(data.toJson());

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
  double? gpa;
  String? companyName;
  String? status;
  DateTime? updateDate;


  factory ListStudentForStaff.fromJson(Map<String, dynamic> json) => ListStudentForStaff(
    id: json["id"],
    studentCode: json["studentCode"],
    fullname: json["fullname"],
    gpa: json["gpa"],
    companyName: json["companyName"],
    status: json["status"],
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studentCode": studentCode,
    "fullname": fullname,
    "gpa": gpa,
    "companyName": companyName,
    "status": status,
    "updateDate": updateDate?.toIso8601String(),
  };
}
