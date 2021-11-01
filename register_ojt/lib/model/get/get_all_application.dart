import 'package:http/http.dart' as http;
import 'package:register_ojt/model/company/model_application_company.dart';
import 'package:register_ojt/utils/url.dart';

class ApplicationCompanys {
  getApplication({token, companyCode}) async {
    var response = await http.get(
        Uri.https("$urlMain", "$urlSendApplication/$companyCode"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi Application Company:${response.statusCode}");
    if (response.statusCode == 200) {
      return applicationCompanyFromJson(response.body);
    } else {
      return null;
    }
  }
}
