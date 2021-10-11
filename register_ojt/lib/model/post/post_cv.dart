import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostSendCV {
  doSend({cv}) async {
    try {
      final response = await http.post(
        Uri.https('$urlMain', 'applications/cv'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode(<String, dynamic>{
          "cv": "$cv",
        }),
      );

      print('Post API Send CV: ${response.statusCode}');
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
