import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/company/model_application_detail.dart';
import 'package:register_ojt/model/get/get_application_detail.dart';
import 'package:register_ojt/model/get/get_cv.dart';
import 'package:register_ojt/model/model_application_student.dart';
import 'package:register_ojt/model/put/put_approve_application.dart';
import 'package:register_ojt/model/put/put_deny_application.dart';
import 'package:register_ojt/view/company/view_all_application.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:register_ojt/view/home_page.dart';

import 'package:register_ojt/view/view_cv.dart';

class ApplicationDetailData extends StatefulWidget {
  int? id;
  String? status;
  ApplicationDetailData({this.id, this.status});

  @override
  _ApplicationDetailDataState createState() => _ApplicationDetailDataState();
}

class _ApplicationDetailDataState extends State<ApplicationDetailData> {
  ApplicationDetail? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    ApplicationDetails details = ApplicationDetails();
    data = await details.getApplicationDetail(appCode: widget.id);
    setState(() {});
    return data;
  }

  approveApplicationStudent() async {
    try {
      ApproveApplicationStudent approveApp = ApproveApplicationStudent();
      int status = await approveApp.approveApplicationStudent(
          companyCode: stuCode, appID: widget.id);
      if (status == 200) {
        loadingSuccess(status: "Approve Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Approve Failed !!!");
    } catch (e) {
      loadingFail(status: "$e");
    }
    return false;
  }

  denyApplicationStudent() async {
    try {
      DenyApplicationStudent denyApp = DenyApplicationStudent();
      int status = await denyApp.denyApplicationStudent(
          companyCode: stuCode, appID: widget.id);
      if (status == 200) {
        loadingSuccess(status: "Deny Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Deny Failed !!!");
    } catch (e) {
      loadingFail(status: "$e");
    }
    return false;
  }

  Widget _appDetails(size, String label, String info) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.15,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            width: size.width * 0.3,
            child: Text(
              info,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Widget showCV({cv}) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.15,
            child: Text(
              "Link CV:         ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          GestureDetector(
            onTap: () async {
              launchURL(cv);
            },
            child: Text(
              "Click to download",
              style: TextStyle(fontSize: 22, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnApprove() {
    return ElevatedButton(
      onPressed: () async {
        bool checkApprove = await approveApplicationStudent();
        if (checkApprove) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AllApplications()));
        } else
          print("Failed");
      },
      child: Text(
        "Approve",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade600),
      ),
    );
  }

  Widget btnDeny() {
    return ElevatedButton(
      onPressed: () async {
        bool checkDeny = await denyApplicationStudent();
        if (checkDeny) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AllApplications()));
        } else
          print("Failed");
      },
      child: Text(
        "Deny",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Application Details",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            _appDetails(size, "MSSV:", "${data?.studentCode ?? ""}"),
            _appDetails(size, "Student's name:", "${data?.studentName ?? ""}"),
            _appDetails(size, "Email:", "${data?.email ?? ""}"),
            _appDetails(size, "Position:", "${data?.position ?? ""}"),
            _appDetails(size, "GPA:", "${data?.gpa ?? ""}"),
            showCV(cv: "${data?.cv}"),
            widget.status == "Processing"
                ? Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            btnApprove(),
                            SizedBox(
                              width: 200,
                            ),
                            btnDeny()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: SizedBox(
                      height: 20,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
