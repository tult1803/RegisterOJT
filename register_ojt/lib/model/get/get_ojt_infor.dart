import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

import '../model_ojt_information.dart';

class GetOJTInfo {
  getData({token}) async {
    try{
    var response = await http.get(
      Uri.https("$urlMain", "$urlOjtInfor"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi OJT Infor:${response.statusCode}");
    if (response.statusCode == 200) {
      return ojtInfomationFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    } catch (e) {

      print('Error: $e');
    }
  }
}
