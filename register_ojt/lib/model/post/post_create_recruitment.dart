import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostCreateRecruitment {
  create(
      {companyCode, content, deadline, salary, majorName, topic, area}) async {
    final response = await http.post(
      Uri.https('$urlMain', '$urlOjtInfor/$companyCode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "content": "$content",
        "deadline": "$deadline",
        "salary": "$salary",
        "majorName": "$majorName",
        "topic": "$topic",
        "area": "$area"
      }),
    );

    print('Post API New Recruitment: ${response.statusCode}');
    return response.statusCode;
  }
}
