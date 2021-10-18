import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_cv.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view_cv.dart';

class ApplicationDetailCompany extends StatefulWidget {
  const ApplicationDetailCompany({Key? key}) : super(key: key);

  @override
  _ApplicationDetailCompanyState createState() =>
      _ApplicationDetailCompanyState();
}

class _ApplicationDetailCompanyState extends State<ApplicationDetailCompany> {
  Widget _appDetails(String label, String info) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Widget showCV({cv}) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "CV:          ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            width: 50,
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: [
            headerCenter(context),
            Container(
      margin: EdgeInsets.only(top: 15),
      width: size.width * 0.5,
      height: size.height * 0.9,
      decoration: BoxDecoration(
            color: Colors.orange[200],
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
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              _appDetails("Name:     ", "Nguyễn Đức Thắng"),
              _appDetails("MSSV:     ", "SE130157"),
              _appDetails("Email:      ", "thangnguyen123@gmail.com"),
              _appDetails("Position: ", "Web Developer"),
              _appDetails("GPA:        ", "8.0"),
              showCV(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Approved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade600),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Denied",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade600),
                    ),
                  )
                ],
              )
            ],
              ),
            ),
      ),
    ),
            footer(context,
                content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),

          ],
        ));
  }
}
