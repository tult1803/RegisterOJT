import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/fpt_admin/import_list_student_for_staff.dart';
import 'package:register_ojt/model/model_get_student_import_list.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:register_ojt/model/get/get_student_list_from_import.dart';
import 'package:register_ojt/view/fpt_admin/check_update_student_information.dart';

class UpdateStudentInFo extends StatefulWidget {
  //const UpdateStudentInFo({Key? key}) : super(key: key);

  @override
  _UpdateStudentInFoState createState() => _UpdateStudentInFoState();
}

class _UpdateStudentInFoState extends State<UpdateStudentInFo> {
  String? token;
  var data;
  var listStatus = ["NotInWork", "Working", "Finished"];
  String? dropDownValue;
  int? roleValue;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue = "NotInWork";
    roleValue = 0;
    getData(0);
  }

  getData(number) async {
    getStudentListFromImport getStuListToImport = getStudentListFromImport();
    data = await getStuListToImport.getStudentsListFromImport(statusCode: number);
    setState(() {});
  }

  Widget _dropDownButton() {
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        items: listStatus.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
            dropDownValue = value;
            switch (value) {
              case "NotInWork":
                roleValue = 0;
                break;
              case "Working":
                roleValue = 1;
                break;
              case "Finished":
                roleValue = 2;
                break;
              default:
                roleValue = 0;
                break;

            }

          getData(roleValue);
        },
      ),
    );
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
          'Update Student Info',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent,
            border: Border.all(width: 0.5, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 0.5,
                color: Colors.transparent.withOpacity(0.1),
                //offset: Offset(0, 10)
              )
            ]),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
            width: size.width * 1.5,
            height: size.height * 2.0,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () async {
                            var picked = await FilePicker.platform.pickFiles();

                            if (picked != null) {
                              // var bytesToRead = picked.files.first.bytes;
                              // Future<void> writeToFile(ByteData bytesToRead, String path) {
                              //   final buffer = bytesToRead.buffer;
                              //   return new File(path).writeAsBytes(
                              //       buffer.asUint8List(bytesToRead.offsetInBytes, bytesToRead.lengthInBytes));
                              // }
                              var NameVar = picked.files.first.bytes;
                              if (picked.files.first.name.contains(".xlsx")) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CheckUpdateStudentInfo(
                                              nameTest: NameVar,
                                            )));
                              } else
                                loadingFail(
                                    status: "Please choose Excel File (.xlsx)");
                            }
                          },
                          child: Text(
                            'Import Student',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Export data',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Column(
                            children: [_dropDownButton()],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(3),
                                4: FlexColumnWidth(2),
                                5: FlexColumnWidth(3),
                                6: FlexColumnWidth(1),
                                7: FlexColumnWidth(1),
                                8: FlexColumnWidth(1),
                                9: FlexColumnWidth(1),
                                10: FlexColumnWidth(3),
                              },
                              border: TableBorder.all(color: Colors.black),
                              children:
                                  (data == null ? [] as List : data as List)
                                      .map((item) => TableRow(children: [
                                            Text(item.studentCode.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.fullname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.gender.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.birthday.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.phone.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.email.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.term.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.credit.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.gpa.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            Text(item.workingStatus.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                                            // you can have more properties of course
                                          ]))
                                      .toList()),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
