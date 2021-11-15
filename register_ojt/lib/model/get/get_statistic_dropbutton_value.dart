import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_statistic_dropbutton.dart';
import 'package:register_ojt/utils/url.dart';

class GetStatisticDropButtonVal{

  getListStatisticStatusVal() async{
    var response = await http.get(
        Uri.https("$urlMain", "$urlGetSemester"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          // 'Authorization': 'Bearer $token',
        });

    print("Status getApi List Semester: ${response.statusCode}");
    if(response.statusCode == 200){
      print(response.body);
      return getStatisticDropButtonFromJson(response.body);
    }else{
      return null;
    }
  }
}