
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class GetCV {
  getData({token}) async {
    try{
    var response = await http.get(
      Uri.https("$urlMain", "$urlGetCV"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi CV:${response.statusCode}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    } catch (e) {
      print('Error: $e');
    }
  }
}