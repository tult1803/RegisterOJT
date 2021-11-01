import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostNewEvaluation {
  newEvaluationStudent({
    studentCode,
    companyCode,
    mark,
    description,
    onWorkDate,
    division,
    lineManagerName,
  }) async {
    final response = await http.post(
      Uri.https('$urlMain', '$urlNewEvaluation'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "studentCode": "$studentCode",
        "companyCode": "$companyCode",
        "mark": "$mark",
        "workSortDescription": "$description",
        "onWorkDate": "$onWorkDate",
        "division": "$division",
        "lineManagerName": "$lineManagerName",
      }),
    );

    print('Post API New Evaluation: ${response.statusCode}');
    return response.statusCode;
  }
}
