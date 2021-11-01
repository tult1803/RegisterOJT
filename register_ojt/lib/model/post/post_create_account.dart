import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostCreateAccount {
  createAccount({companyID, username, password, name, email}) async {
    final response = await http.post(
      Uri.https('$urlMain', '$urlCompany/newaccount/$companyID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "username": "$username",
        "password": "$password",
        "fullname": "$name",
        "email": "$email",
      }),
    );

    print('Post API New Account: ${response.statusCode}');
    return response.statusCode;
  }
}
