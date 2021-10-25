import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class DenyApplicationStudent {
  denyApplicationStudent({
    companyCode,
    appID,
  }) async {
    final response = await http.put(
      Uri.https('$urlMain', '$urlDenyApplication/$companyCode/$appID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    print('Put API Deny Evaluation: ${response.statusCode}');
    return response.statusCode;
  }
}
