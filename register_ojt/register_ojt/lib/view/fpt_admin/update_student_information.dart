import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/fpt_admin/import_list_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:file_picker/file_picker.dart';

class UpdateStudentInFo extends StatefulWidget {
  //const UpdateStudentInFo({Key? key}) : super(key: key);

  @override
  _UpdateStudentInFoState createState() => _UpdateStudentInFoState();
}

class _UpdateStudentInFoState extends State<UpdateStudentInFo> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
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
        margin: EdgeInsets.fromLTRB(40, 15, 40, 10),
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
            margin: EdgeInsets.fromLTRB(30, 15, 30, 50),
            width: size.width * 0.8,
            height: size.height * 1.4,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
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
                                  builder: (context) => ImportListStudent(
                                        nameTest: NameVar,
                                      )));
                        } else
                          loadingFail(status: "Please choose Excel File (.xlsx)");
                      }
                    },
                    child: Text(
                      'Import Student',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Export data',
                      style: TextStyle(fontSize: 35),
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
