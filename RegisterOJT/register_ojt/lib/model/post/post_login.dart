import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/utils/url.dart';

class PostLogin {
  login({String? firebaseToken, int? role}) async {
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
    if(response.statusCode == 200){
      print('Code: ${data.code} - Role: ${data.role}');
      setDataSession(key: "token", value: "${data.token}");
      setDataSession(key: "code", value: "${data.code}");
      setDataSession(key: "name", value: "${data.name}");
    }

    return response.statusCode;
    // if (response.statusCode == 200) {
    //   return json.decode(response.body);
    // } else {
    //   print('Failed to load data - ${response.statusCode}');
    // }
  }
}
