import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_student_profile.dart';
import 'package:register_ojt/model/model_profile_student.dart';
import 'package:register_ojt/utils/helpers.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({Key? key}) : super(key: key);

  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
   Student? _student;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    loadingLoad(status: "Loading...");
    StudentProfile data = StudentProfile();
     _student = await data.getProfile(idStudent: await getDataSession(key: "code"), token: await getDataSession(key: "token"));
    setState(() {});
    if(_student?.stuCode == null){
      loadingFail(status: "Failed to load data !!!");
    }else loadingSuccess(status: 'Successed !!!');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
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
                  containerProfile(size, title: "Major", content: "${_student?.major ?? "-----"}"),
                  containerProfile(size, title: "Current Term", content: "${_student?.term ?? "-----"}"),
                  containerProfile(size, title: "GPA", content: "7.2 (Chua API)"),
                  containerProfile(size, title: "Student Id", content: "${_student?.stuCode ?? "-----"}"),
                  containerProfile(size, title: "Full Name", content: "${_student?.fullName ?? "-----"}"),
                  containerProfile(size, title: "Birthday", content: "${(_student?.birthDate?.substring(0, 10)) ?? "-----"}"),
                  containerProfile(size, title: "Phone", content: "${_student?.phone ?? "-----"}"),
                  containerProfile(size, title: "Gender", content: "${_student?.gender ?? "-----"}"),
                  containerProfile(size, title: "Email", content: "${_student?.email ?? "-----"}", showBottom: true),
                ],
              )),
        ),
      ),
    );
  }

}
