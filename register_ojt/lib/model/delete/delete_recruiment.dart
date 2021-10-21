import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class DeleteRecruiments{

  detele({token, id, companyCode}) async{
    var response = await http.delete(
        Uri.https("$urlMain", "$urlDeleteRecruiment/$id/$companyCode"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });
    print("Status getApi App Student:${response.statusCode}");
    return response.statusCode;
  }
}