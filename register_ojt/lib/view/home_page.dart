import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/utils/google_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/company/view_all_student.dart';
import 'package:register_ojt/view/company/view_all_application.dart';
import 'package:register_ojt/view/company/view_all_recruitment.dart';
import 'package:register_ojt/view/fpt_admin/company_feedback.dart';
import 'package:register_ojt/view/student/ojt_information.dart';
import 'package:register_ojt/view/student/profile.dart';
import 'package:register_ojt/view/student/view_application.dart';

import 'fpt_admin/view_all_student.dart';

class HomePage extends StatefulWidget {
  // role: 0 - Student
  // role: 1 - Admin FPT
  // role: 2 - Company
  int role;

  HomePage({required this.role});

  @override
  _HomePageState createState() => _HomePageState();
}

String? stuCode;
String? stuName;
bool? isPassCriteria;

class _HomePageState extends State<HomePage> {
  late Widget _widget;
  String? currentNamePage;
  var token;

  _getData() async {
    token = await getDataSession(key: "token");
    stuName = await getDataSession(key: "name");
    stuCode = await getDataSession(key: "stuCode");
    isPassCriteria = await getDataSession(key: "isPassCriteria");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFirstPage();
    _getData();
  }

  setFirstPage() {
    switch (widget.role) {
      case 0:
        currentNamePage = "OJT Information";
        _widget = OjtInfor();
        break;
      case 1:
        currentNamePage = "OJT Request";
        _widget = AllStudent();
        ;
        break;
      case 2:
        currentNamePage = "Recruitment";
        _widget = AllRecruitment();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          header(context),
          topBar(context),
          Container(
            child: _widget,
          ),
          footer(context,
              content:
                  "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      color: Colors.orangeAccent,
      child: Row(
        children: [
          Flexible(
              flex: 10,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                width: size.width,
                child: Image.asset("images/fpt_logo.png"),
              )),
          Flexible(
              flex: 1,
              child: miniContainer("Logout", isHiddenColor: true, index: 3)),
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: size.width * 0.6,
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              // width: size.width * 0.3,
              child: Text(
                "${stuCode == null ? "" : "$stuCode - "} ${stuName ?? "---"} | $currentNamePage",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: _wrapRole()),
            ),
          ],
        ),
      ),
    );
  }

  Widget miniContainer(String title,
      {required bool isHiddenColor, required int index}) {
    return Container(
      decoration: BoxDecoration(
          color: isHiddenColor == true ? Colors.orangeAccent : Colors.white54,
          borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: 150,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          setState(() {
            currentNamePage = title;
            _screenRole(index: index);
          });
        },
        child: Center(
            child: Text(
          "$title",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),
        )),
      ),
    );
  }

  _screenRole({required int index}) {
    if (widget.role == 0) {
      switch (index) {
        case 0:
          _widget = OjtInfor();
          break;
        case 1:
          _widget = ViewApplication();
          break;
        case 2:
          _widget = ProfileStudent();
          break;
        case 3:
          signOut(context);
          break;
      }
    } else if (widget.role == 1) {
      switch (index) {
        case 0:
          _widget = AllStudent();
          break;
        case 1:
          _widget = FeedBackCompany();
          break;
        case 3:
          signOut(context);
          break;
      }
    } else {
      switch (index) {
        case 0:
          _widget = AllRecruitment();
          break;
        case 1:
          _widget = AllApplications();
          break;
        case 2:
          _widget = EvaluateStudent();
          break;
        case 3:
          signOut(context);
          break;
      }
    }
  }

  Widget _wrapRole() {
    if (widget.role == 0) {
      return Wrap(
        spacing: 10,
        children: [
          miniContainer("OJT Information", isHiddenColor: false, index: 0),
          miniContainer("View Application", isHiddenColor: false, index: 1),
          miniContainer("Profile", isHiddenColor: false, index: 2),
          // miniContainer("Logout", isHiddenColor: true, index: 3),
        ],
      );
    } else if (widget.role == 1) {
      return Wrap(
        spacing: 10,
        children: [
          miniContainer("OJT Request", isHiddenColor: false, index: 0),
          miniContainer("Company Report", isHiddenColor: false, index: 1),
          // miniContainer("Logout", isHiddenColor: true, index: 2),
        ],
      );
    } else {
      return Wrap(
        spacing: 10,
        children: [
          miniContainer("Recruitment", isHiddenColor: false, index: 0),
          miniContainer("Application", isHiddenColor: false, index: 1),
          miniContainer("Evaluate", isHiddenColor: false, index: 2),
          // miniContainer("Logout", isHiddenColor: true, index: 3),
        ],
      );
    }
  }
}
