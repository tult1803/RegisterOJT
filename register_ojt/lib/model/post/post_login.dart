import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostLogin {
  login({String? firebaseToken, int? role}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.https('$urlMain', '$urlLogin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "role": role,
        "fireBaseToken": "$firebaseToken",
      }),
    );
    print("Status postApi Login:${response.statusCode}");
    ModelLogin data = ModelLogin();
    data = ModelLogin.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      prefs.setString("token", "${data.token}");
      prefs.setString("name", "${data.name}");
      prefs.setString("stuCode", "${data.code}");
      prefs.setBool("isPassCriteria", data.isPassCriteria ?? false);
      print(
          'Code: ${data.code} - Role: ${data.role} - isPassCriteria: ${data.isPassCriteria}');
    }

    return response.statusCode;
    // if (response.statusCode == 200) {
    //   return json.decode(response.body);
    // } else {
    //   print('Failed to load data - ${response.statusCode}');
    // }
  }
}

class PostLoginUsername {
  login({String? username, String? password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.https('$urlMain', '$urlLoginUsername'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "username": "$username",
        "password": "$password"
      }),
    );
    print("Status postApi Login User/Pass:${response.statusCode}");
    ModelLogin data = ModelLogin();
    data = ModelLogin.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      prefs.setString("token", "${data.token}");
      prefs.setString("name", "${data.name}");
      prefs.setString("stuCode", "${data.code}");
      prefs.setString("companyName", "${data.companyName}");
      print(
          'Code: ${data.code} - Role: ${data.role} - isPassCriteria: ${data.companyName}');
    }

    return response.statusCode;
  }
}