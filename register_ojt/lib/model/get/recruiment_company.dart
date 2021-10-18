import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

import '../model_ojt_information.dart';

class GetRecruiCompany {
  getData({token, name}) async {
    try{
      var response = await http.get(
          Uri.https("$urlMain", "$urlOjtInfor/Company/$name"),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            // 'Authorization': 'Bearer $token',
          });

      print("Status getApi Recruiment Company:${response.statusCode}");
      if (response.statusCode == 200) {
        return ojtInfomationFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {

      print('Error: $e');
    }
  }
}
