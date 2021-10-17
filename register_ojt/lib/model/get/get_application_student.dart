import 'package:http/http.dart' as http;
import 'package:register_ojt/model/model_application_student.dart';
import 'package:register_ojt/utils/url.dart';

 class ApplicationStudents{

   getApplication({token, studentCode}) async{
     var response = await http.get(
         Uri.https("$urlMain", "$urlAppStudent/$studentCode"),
         headers: {
           "Accept": "application/json",
           "Access-Control-Allow-Origin": "*",
           // 'Authorization': 'Bearer $token',
         });

     print("Status getApi App Student:${response.statusCode}");
     if(response.statusCode == 200){
       return applicationStudentFromJson(response.body);
     }else{
       return null;
     }
 }
 }