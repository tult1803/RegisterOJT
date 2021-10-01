import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_profile_student.dart';
import 'package:register_ojt/utils/url.dart';

class StudentProfile {
  getProfile({String? token, String? idStudent}) async {
    try {
      var response = await http.get(
          Uri.https('$urlMain', '$urlStudent/$idStudent'),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            'Authorization': 'Bearer $token',
          });

      print("Status getApi Student Profile:${response.statusCode}");

      if (response.statusCode == 200) {
        return Student.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('$e');
    }
  }
}
