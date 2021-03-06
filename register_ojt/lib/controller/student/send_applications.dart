import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/post/post_send_application.dart';
import 'package:register_ojt/utils/check_data.dart';
import 'package:register_ojt/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendApplications extends StatefulWidget {
  String? idCompany;

  SendApplications({this.idCompany});

  @override
  _SendApplicationsState createState() => _SendApplicationsState();
}

class _SendApplicationsState extends State<SendApplications> {
  String? cvName, letter, errName, errId;
  PlatformFile? file;
  String? studentId, fullName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('${widget.idCompany}');
  }

  getData() {
    studentId = stuCode;
    fullName = stuName;
    setState(() {});
  }

  doSendApplication() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      loadingLoad(status: "Processing...");
      String? cvLink;
      var fileBytes = file!.bytes;
      var fileName = file!.name;
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .getDownloadURL()
          .then((value) => cvLink = value);
      if (cvLink != null || cvLink != "") {
        PostSendApplication sendApplication = PostSendApplication();
        int status = await sendApplication.doSend(
            recruimentId: widget.idCompany,
            stuId: studentId,
            stuName: fullName,
            coverLetter: letter,
            cv: cvLink);
        if (status == 200) {
          loadingSuccess(status: "Send Success !!!");
          isPassCriteria = false;
          prefs.setBool("isPassCriteria", false);
          setState(() {});
          return true;
        } else
          loadingFail(status: "Send Application Failed !!!");
      } else {
        loadingFail(status: "Send CV Failed !!!");
      }
    } catch (e) {
      loadingFail(status: "$e");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Apply Application",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _txtFormField("Student Id:",
                hintText: "Nh???p m?? s??? sinh vi??n",
                maxLength: 10,
                error: errId,
                value: "${stuCode ?? ""}"),
            _txtFormField("Full Name:",
                hintText: "Nh???p h??? v?? t??n",
                maxLength: 50,
                error: errName,
                value: "${stuName ?? ""}"),
            coverLetter(),
            choosePDF(),
            submitButton(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget coverLetter() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cover Letter (Th?? xin vi???c):"),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Kh??ng b???t bu???c",
              //Sau khi click v??o "Nh???p ti??u ?????" th?? m??u vi???n s??? ?????i
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
              ),
              //Hi???n th??? l???i
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              //Nh???n th??ng b??o l???i
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
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );

                  if (result != null) {
                    file = result.files.first;
                    print(file?.name);
                    print(file?.size);
                    setState(() {
                      cvName = file?.name;
                    });
                    // file.bytes l?? d??ng ????? truy???n cho server
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
      {required String hintText,
      required int maxLength,
      String? error,
      required value}) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title"),
          TextFormField(
            maxLines: 1,
            maxLength: maxLength,
            initialValue: value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "$hintText",
              //Sau khi click v??o "Nh???p ti??u ?????" th?? m??u vi???n s??? ?????i
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45),
              ),
              //Hi???n th??? l???i
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              //Nh???n th??ng b??o l???i
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
            bool isEmptyCV = validateCV(context, file?.bytes);
            setState(() {
              errId = validateStudentId(studentId);
              errName = validateFullName(fullName);
            });
            if (isEmptyCV && errId == null && errName == null) {
              if(file!.name.contains(".pdf")){
                bool checkSend = await doSendApplication();
                if (checkSend) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage(role: 0)));
                }
              }else loadingFail(status: "Check format File Attach");
            }
          },
          child: Text("Submit")),
    );
  }
}
