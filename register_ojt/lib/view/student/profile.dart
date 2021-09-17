import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({Key? key}) : super(key: key);

  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minWidth: size.width * 0.6,
            maxWidth: size.width * 0.6,
          ),
          child: new DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  containerProfile(size, title: "Major", content: "SE"),
                  containerProfile(size, title: "Current Term", content: "10"),
                  containerProfile(size, title: "GPA", content: "7.2"),
                  containerProfile(size, title: "Student Id", content: "SE130223"),
                  containerProfile(size, title: "Full Name", content: "Lê Thanh Tú"),
                  containerProfile(size, title: "Birthday", content: "20/01/1999"),
                  containerProfile(size, title: "Phone", content: "0912345678"),
                  containerProfile(size, title: "Gender", content: "Male"),
                  containerProfile(size, title: "Email", content: "tultse130223@fpt.edu.vn", showBottom: true),
                ],
              )),
        ),
      ),
    );
  }

}
