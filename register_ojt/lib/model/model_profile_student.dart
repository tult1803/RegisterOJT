import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.major,
    this.term,
    this.stuCode,
    this.fullName,
    this.birthDate,
    this.phone,
    this.gender,
    this.address,
    this.email,
    this.gpa
  });

  String? major;
  int? term;
  double? gpa;
  String? stuCode;
  String? fullName;
  String? birthDate;
  String? phone;
  String? gender;
  String? address;
  String? email;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    major: json["major"],
    term: json["term"],
    stuCode: json["stuCode"],
    fullName: json["fullName"],
    birthDate: json["birthDate"],
    phone: json["phone"],
    gender: json["gender"],
    address: json["address"],
    email: json["email"],
    gpa: json["gpa"],
  );

  Map<String, dynamic> toJson() => {
    "major": major,
    "term": term,
    "stuCode": stuCode,
    "fullName": fullName,
    "birthDate": birthDate,
    "phone": phone,
    "gender": gender,
    "address": address,
    "email": email,
    "gpa": gpa
  };
}
