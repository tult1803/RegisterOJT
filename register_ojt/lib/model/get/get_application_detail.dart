import 'package:http/http.dart' as http;
import 'package:register_ojt/model/company/model_application_detail.dart';
import 'package:register_ojt/utils/url.dart';

class ApplicationDetails {
  getApplicationDetail({appCode}) async {
    var response = await http.get(
        Uri.https("$urlMain", "$urlApplicationDetails/$appCode"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi Application Detail:${response.statusCode}");
    if (response.statusCode == 200) {
      return appDetailFromJson(response.body);
    } else {
      return null;
    }
  }
}
