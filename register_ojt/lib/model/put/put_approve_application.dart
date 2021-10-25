import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class ApproveApplicationStudent {
  approveApplicationStudent({
    companyCode,
    appID,
  }) async {
    final response = await http.put(
      Uri.https('$urlMain', '$urlApproveApplication/$companyCode/$appID'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    print('Put API Approve Evaluation: ${response.statusCode}');
    return response.statusCode;
  }
}
