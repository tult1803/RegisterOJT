import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/utils/check_data.dart';
import 'package:register_ojt/view/view_cv.dart';

class SendApplication extends StatefulWidget {
  String? idCompany;

  SendApplication({this.idCompany});

  @override
  _SendApplicationState createState() => _SendApplicationState();
}

class _SendApplicationState extends State<SendApplication> {
  String? cvName, letter, errName, errId;
  String? studentId, fullName;
  Uint8List? _cv;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.idCompany}');
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: size.width * 0.5,
        height: size.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 4,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: leadingAppbar(context, colorIcon: Colors.black87),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Apply Application",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   child: Text(
                //     "Registration Application",
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //   ),
                // ),
                _txtFormField("Student Id:",
                    hintText: "Nhập mã số sinh viên",
                    maxLength: 10,
                    error: errId),
                _txtFormField("Full Name:",
                    hintText: "Nhập họ và tên", maxLength: 50, error: errName),
                coverLetter(),
                choosePDF(),
                submitButton(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget coverLetter() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cover Letter (Thư xin việc):"),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Không bắt buộc",
              //Sau khi click vào "Nhập tiêu đề" thì màu viền sẽ đổi
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
              ),
              //Hiển thị lỗi
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              //Nhận thông báo lỗi
              // errorText: errorUsername,
            ),
            onChanged: (value) {
              setState(() {
                letter = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget choosePDF() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text("File Attach: ${cvName == null ? "-----" : "$cvName"}"),
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: TextButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );

                  if (result != null) {
                    PlatformFile file = result.files.first;

                    print(file.name);
                    print(file.size);
                    setState(() {
                      cvName = file.name;
                      _cv = file.bytes;
                    });
                    // file.bytes là dùng để truyền cho server
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text("Choose file .pdf")),
          ),
        ],
      ),
    );
  }

  Widget _txtFormField(String title,
      {required String hintText, required int maxLength, String? error}) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title"),
          TextField(
            maxLines: 1,
            maxLength: maxLength,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "$hintText",
              //Sau khi click vào "Nhập tiêu đề" thì màu viền sẽ đổi
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
              ),
              //Hiển thị lỗi
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              //Nhận thông báo lỗi
              errorText: error,
            ),
            onChanged: (value) {
              setState(() {
                if (title.contains("Id")) {
                  studentId = value.trim();
                } else if (title.contains("Name")) {
                  fullName = value.trim();
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100,
      height: 40,
      child: ElevatedButton(
          onPressed: () async {
            bool isEmptyCV = validateCV(context, _cv);
            setState(() {
              errId = validateStudentId(studentId);
              errName = validateFullName(fullName);
            });
            if (isEmptyCV && errId == null && errName == null) {
              print(_cv);
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ViewCV(cv: _cv!),
              // ));
            }
          },
          child: Text("Submit")),
    );
  }
}
