
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

import '../model_recruiment_detail.dart';
class RecDetail{
  getDetail(id) async{
    try{
      var response = await http.get(
          Uri.https("$urlMain", "$urlOjtInfor/detail/$id"),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            // 'Authorization': 'Bearer $token',
          });

      print("Status getApi Recruiment Detail:${response.statusCode}");
      if (response.statusCode == 200) {
        return recruiDetailFromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
 }