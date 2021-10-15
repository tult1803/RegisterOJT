import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostSendApplication {
  doSend({recruimentId, stuId, stuName, coverLetter, cv}) async {
    int? recruiId = int.tryParse("$recruimentId");
    final response = await http.post(
      Uri.https('$urlMain', '$urlSendApplication'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "cv": "$cv",
        "recruimentInformationId": recruiId,
        "studentCode": "$stuId",
        "studentName": "$stuName",
        "coverLetter": "${coverLetter ?? ""}"
      }),
    );

    print('Post API Send Application: ${response.statusCode}');
    return response.statusCode;
  }
}