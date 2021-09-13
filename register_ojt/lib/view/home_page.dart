import 'package:flutter/material.dart';
import 'package:register_ojt/utils/google_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/company/evaluate_student_progress.dart';
import 'package:register_ojt/view/company/view__all_application.dart';
import 'package:register_ojt/view/fpt_admin/company_feedback.dart';
import 'package:register_ojt/view/student/ojt_information.dart';
import 'package:register_ojt/view/student/profile.dart';
import 'package:register_ojt/view/student/send_application.dart';
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

class _HomePageState extends State<HomePage> {
  late Widget _widget;
  String? currentNamePage;
  var token;

  _getToken() async {
    token = await getDataSession(key: "token");
    setState(() {
      token = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentNamePage = "OJT Information";
    _widget = OjtInfor();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          topBar(context),
          Container(
            child: _widget,
          ),
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: size.width * 0.3,
            child: Text(
              "SE130223 - Lê Thanh Tú | $currentNamePage",
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
        case 2:
          signOut(context);
          break;
      }
    } else {
      switch (index) {
        case 0:
          _widget = AllApplications();
          break;
        case 1:
          _widget = EvaluateStudent();
          break;
        case 2:
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
          miniContainer("Logout", isHiddenColor: true, index: 3),
        ],
      );
    } else if (widget.role == 1) {
      return Wrap(
        spacing: 10,
        children: [
          miniContainer("Student", isHiddenColor: false, index: 0),
          miniContainer("Feed Back", isHiddenColor: false, index: 1),
          miniContainer("Logout", isHiddenColor: true, index: 2),
        ],
      );
    } else {
      return Wrap(
        spacing: 10,
        children: [
          miniContainer("Application", isHiddenColor: false, index: 0),
          miniContainer("Evaluate", isHiddenColor: false, index: 1),
          miniContainer("Logout", isHiddenColor: true, index: 2),
        ],
      );
    }
  }
}
