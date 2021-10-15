import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostSendCV {
  doSend({required PlatformFile cv, studentCode}) async {
    try {
      final response = await http.post(
        Uri.https('$urlMain', 'applications/Cv/$studentCode'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode(<String, dynamic>{
          "CvFile": "${cv.bytes}"
        }),
      );

      print('Post API Send CV: ${response.statusCode}');
      if(response.statusCode == 200) {
        return jsonDecode(response.body);
      }else return "";
    } catch (e) {
      print(e);
    }
  }
}
