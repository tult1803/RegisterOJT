import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/fpt_admin/import_list_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class CheckUpdateStudentInfo extends StatefulWidget {
  //const UpdateStudentInFo({Key? key}) : super(key: key);
  Uint8List? nameTest;

  CheckUpdateStudentInfo({this.nameTest});

  @override
  _CheckUpdateStudentInfoState createState() => _CheckUpdateStudentInfoState();
}

class _CheckUpdateStudentInfoState extends State<CheckUpdateStudentInfo> {
  String? token;
  List<dynamic>? listStudent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    readXLSX();
    setState(() {});
    return 1;
  }

  void readXLSX() async {
    var bytes = widget.nameTest;
    var excel = Excel.decodeBytes(bytes);
    int j = 0;
    var arr = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        arr.add(row);
      }
    }
    listStudent = arr;

    setState(() {});

    // print(arr);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Check Import Student',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (listStudent!.length != null) {
                return ListView.builder(
                  itemCount: listStudent!.length,
                  itemBuilder: (context, index) {
                    print(index);
                    // String dayOfBirth = new DateFormat('yyyy/MM/dd HH:mm:ss').parse(listStudent?[index][1]);
                    return Column(
                      children: [
                        containerInfo(
                          phone: listStudent?[index][0],
                          birthday: listStudent?[index][1],
                          term: listStudent?[index][2],
                          credit: listStudent?[index][3],
                          gpa: listStudent?[index][4],
                          majorName: listStudent?[index][5],
                          studentCode: listStudent?[index][6],
                          email: listStudent?[index][7],
                          fullname: listStudent?[index][8],
                          gender: listStudent?[index][9],
                        ),
                        Visibility(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: TextButton(
                                    autofocus: true,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ImportListStudent(nameTest: widget.nameTest)));
                                    },
                                    child: Text(
                                      'Send Data',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.orangeAccent
                                  ),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  child: TextButton(
                                    autofocus: true,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                      foregroundColor:
                                      MaterialStateProperty.all<Color>(Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red
                                  ),
                                ),
                              ],
                            ),
                            visible: index == listStudent!.length - 1),
                        SizedBox(height: 30,)
                      ],
                    );
                  },
                );
              } else {
                return Center(child: Text("Data is empty !!!"));
              }
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget containerInfo(
      {phone,
      birthday,
      term,
      credit,
      gpa,
      majorName,
      studentCode,
      email,
      fullname,
      gender}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          Text("Major: $majorName"),
          SizedBox(
            height: 5,
          ),
          Text("StudentCode: $studentCode"),
          SizedBox(
            height: 5,
          ),
          Text("Fullname: $fullname"),
          SizedBox(
            height: 5,
          ),
          Text("Gender: $gender"),
          SizedBox(
            height: 5,
          ),
          Text("Birthday: $birthday"),
          SizedBox(
            height: 5,
          ),
          Text("Phone: $phone"),
          SizedBox(
            height: 5,
          ),
          Text("Email: $email"),
          SizedBox(
            height: 5,
          ),
          Text("Term: $term"),
          SizedBox(
            height: 5,
          ),
          Text("Credit: $credit"),
          SizedBox(
            height: 5,
          ),
          Text("GPA: $gpa"),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
