import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_company_staff.dart';
import 'package:register_ojt/utils/url.dart';

class Companies {
  getCompanies({token, staffCode}) async {
    var response = await http.get(
        Uri.https("$urlMain", "$urlCompany/fptstaff/$staffCode"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi All Company:${response.statusCode}");
    if (response.statusCode == 200) {
      return companyFromJson(response.body);
    } else {
      return null;
    }
  }
}
