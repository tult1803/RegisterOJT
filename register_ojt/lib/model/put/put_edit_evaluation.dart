import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class EditEvaluationStudent {
  editEvaluationStudent({
    studentCode,
    mark,
    description,
    onWorkDate,
    division,
    lineManagerName,
  }) async {
    final response = await http.put(
      Uri.https('$urlMain', '$urlEditEvaluation/$studentCode'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "mark": "$mark",
        "workSortDescription": "$description",
        "onWorkDate": "$onWorkDate",
        "division": "$division",
        "lineManagerName": "$lineManagerName",
      }),
    );

    print('Put API Edit Evaluation: ${response.statusCode}');
    return response.statusCode;
  }
}
