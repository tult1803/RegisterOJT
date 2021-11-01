import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_account_staff.dart';
import 'package:register_ojt/utils/url.dart';

class CompanyAccounts {
  getAccounts({token, companyID}) async {
    var response = await http
        .get(Uri.https("$urlMain", "$urlCompany/account/$companyID"), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      // 'Authorization': 'Bearer $token',
    });

    print("Status getApi All Company's Account:${response.statusCode}");
    if (response.statusCode == 200) {
      return companyAccountFromJson(response.body);
    } else {
      return null;
    }
  }
}
