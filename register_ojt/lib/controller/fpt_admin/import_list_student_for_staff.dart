import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:excel/excel.dart';
import 'package:register_ojt/model/post/post_list_student_to_import.dart';
import 'package:register_ojt/view/fpt_admin/update_student_information.dart';

class ImportListStudent extends StatefulWidget {
  //const ImportListStudent({Key? key}) : super(key: key);
  Uint8List? nameTest;

  ImportListStudent({this.nameTest});

  @override
  _ImportListStudentState createState() => _ImportListStudentState();
}

class _ImportListStudentState extends State<ImportListStudent> {
  String? token;  int statusCode =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadFilePath();
    // print(widget.nameTest);
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  void ReadFilePath() async {
    var bytes = widget.nameTest;
    var excel = Excel.decodeBytes(bytes);
    int j = 0;
    var arr = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        arr.add({
          "phone": row[0],
          "birthday": row[1],
          "term": row[2],
          "credit": row[3],
          "gpa": row[4],
          "majorName": row[5],
          "studentCode": row[6],
          "email": row[7],
          "fullname": row[8],
          "gender": row[9]
        });
      }
    }
    // print(arr);
    PostListStudentToImport postListStudentToImport = PostListStudentToImport();
    int status = await postListStudentToImport.doSend(arr);

    if (status == 200) {
      loadingSuccess(status: "Send Success !!!");
      statusCode = 200;
      setState(() {});
    } else
      loadingFail(status: "Send Info Failed !!!");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UpdateStudentInFo()));
            },
            child: Text(statusCode==200?'Click To Go Back':'', style: TextStyle(fontSize: 35,),),
          ),
        ],
      ),
    );
  }
}
