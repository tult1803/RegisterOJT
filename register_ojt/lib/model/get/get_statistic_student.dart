import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

import '../model_statistic_student.dart';

class GetStatisticStudent {
  getData({semesterName}) async {
    try {
      var response = await http
          .get(Uri.https("$urlMain", "$urlGetSemester/student/$semesterName"));

      print("Status getApi Statistic Student:${response.statusCode}");
      if (response.statusCode == 200) {
        return statisticStudentFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
