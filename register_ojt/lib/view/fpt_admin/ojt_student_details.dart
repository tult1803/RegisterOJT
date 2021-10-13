import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:register_ojt/components/component.dart';

class OjtStudentDetails extends StatefulWidget {
  String? id;

  OjtStudentDetails({this.id});

  @override
  _OjtStudentDetailsState createState() => _OjtStudentDetailsState();
}

class _OjtStudentDetailsState extends State<OjtStudentDetails> {
  String? content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                "Thông tin sinh viên thực tập",
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
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: size.width,
                    child: Center(
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  containerRecruiment(size,
                      title: "MSSV:",
                      content: "SE130633"),
                  containerRecruiment(size,
                      title: "Họ và Tên:",
                      content: "Đoàn Quang Huy"),
                  containerRecruiment(size,
                      title: "Chuyên Ngành:", content: "SE"),
                  containerRecruiment(size,
                      title: "Email:",
                      content: "huydqse130633@fpt.edu.vn"),
                  containerRecruiment(size,
                      title: "GPA:",
                      content: "7.0/10.0"),
                  containerRecruiment(size,
                      title: "Company Request:",
                      content: "FPT Software"),
                  containerRecruiment(size,
                      title: "CV:",
                      content: "https://drive.google.com/drive/u/0/my-drive",
                      showBottom: true), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
