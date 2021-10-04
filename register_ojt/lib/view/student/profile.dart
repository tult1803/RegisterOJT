import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/student/profile.dart';
import 'package:register_ojt/model/get/get_student_profile.dart';
import 'package:register_ojt/model/model_profile_student.dart';
import 'package:register_ojt/utils/helpers.dart';

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
              child: Profile()),
        ),
      ),
    );
  }
}
