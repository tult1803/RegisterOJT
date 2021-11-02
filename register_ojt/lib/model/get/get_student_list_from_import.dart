import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_get_student_import_list.dart';
import 'package:register_ojt/utils/url.dart';

class getStudentListFromImport{

  getStudentsListFromImport({statusCode}) async{
    var response = await http.get(
        Uri.https("$urlMain", "$urlGetImportStuList/$statusCode"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status get Ojt Student for Staff:${response.statusCode}");
    if(response.statusCode == 200){
      return getStudentImportListFromJson(response.body);
    }else{
      return null;
    }
  }
}