import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_company_report_for_staff.dart';
import 'package:register_ojt/utils/url.dart';

class ListReportsForStaff{

  getListReportsForStaff({token}) async{
    var response = await http.get(
        Uri.https("$urlMain", "$urlComReportForStaff"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi List Student:${response.statusCode}");
    if(response.statusCode == 200){
      return listReportForStaffFromJson(response.body);
    }else{
      return null;
    }
  }
}