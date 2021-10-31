import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:register_ojt/utils/url.dart';

class PostListStudentToImport {
  doSend(studentList) async {
    // print(studentList);
    final response =
        await http.post(Uri.https('$urlMain', '$urlImportStuForStaff'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Accept": "application/json",
              "Access-Control-Allow-Origin": "*",
            },
            body: jsonEncode(<String, dynamic>{"studentList": studentList}));
    print (jsonEncode(<String, dynamic>{"studentList": studentList}));
    print('Post API Import List Student: ${response.statusCode}');
    print(response.body);
    return response.statusCode;
  }
}
