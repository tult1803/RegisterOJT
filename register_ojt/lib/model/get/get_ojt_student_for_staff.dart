import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_ojt_student_for_staff.dart';
import 'package:register_ojt/utils/url.dart';

class DetailStudentForStaff{

  getDetailStudentsForStaff({id}) async{
    var response = await http.get(
        Uri.https("$urlMain", "$urlOJTStuForStaff/$id"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status get Ojt Student for Staff:${response.statusCode}");
    if(response.statusCode == 200){
      return detailOjtStudentForStaffFromJson(response.body);
    }else{
      return null;
    }
  }
}