import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostCreateCompany {
  createCompany({name, address, webSite}) async {
    final response = await http.post(
      Uri.https('$urlMain', '$urlCompany/newcompany'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, dynamic>{
        "companyName": "$name",
        "address": "$address",
        "webSite": "$webSite",
      }),
    );

    print('Post API New Company: ${response.statusCode}');
    return response.statusCode;
  }
}
