import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/model/company/model_evaluation_company.dart';
import 'package:register_ojt/utils/url.dart';

class EvaluationDetail {
  getDetail({String? idStudent}) async {
    var response = await http.get(
        Uri.https('$urlMain', '$urlEvaluationDetails/$idStudent'),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        });

    print("Status getApi:${response.statusCode}");
    if (response.statusCode == 200) {
      return Evaluation.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      print("Don't have data");
    } else {
      throw Exception('Failed to load data');
    }
  }
}
