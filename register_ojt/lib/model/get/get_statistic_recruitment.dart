import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

import '../model_statistic_recruitment.dart';

class GetStatisticRecruitment {
  getData({semesterName}) async {
    try {
      var response = await http.get(Uri.https("$urlMain",
          "$urlGetSemester/recruitment_informations/$semesterName"));

      print("Status getApi Statistic Recruitment:${response.statusCode}");
      if (response.statusCode == 200) {
        return statisticRecruitmentFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
