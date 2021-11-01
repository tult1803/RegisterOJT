import 'package:http/http.dart' as http;
import 'package:register_ojt/model/company/model_student_company.dart';
import 'package:register_ojt/utils/url.dart';

class StudentsCompany {
  getStudent({token, companyCode}) async {
    var response = await http
        .get(Uri.https("$urlMain", "$urlViewStudents/$companyCode"), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      // 'Authorization': 'Bearer $token',
    });

    print("Status getApi Student Company:${response.statusCode}");
    if (response.statusCode == 200) {
      return studentCompanyFromJson(response.body);
    } else {
      return null;
    }
  }
}
