import 'package:flutter/material.dart';
import 'package:register_ojt/controller/fpt_admin/list_student_for_staff.dart';

import 'package:register_ojt/view/fpt_admin/update_student_information.dart';
import 'package:register_ojt/view/fpt_admin/view_statistic.dart';

class AllStudent extends StatefulWidget {
  const AllStudent({Key? key}) : super(key: key);

  @override
  _AllStudentState createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 15, right: 30),
              height: 50,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateStudentInFo()));
                  },
                  child: Text(
                    "Update Student Info",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Positioned(
            right: 200,
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 15, right: 30),
              height: 50,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewStatistic()));
                  },
                  child: Text(
                    "Statistic",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 70, 40, 10),
            height: size.height * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.transparent,
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 0.5,
                    color: Colors.transparent.withOpacity(0.1),
                    //offset: Offset(0, 10)
                  )
                ]),
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 15, 30, 50),
                width: size.width * 0.8,
                height: size.height * 1.4,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListStudentForStaffData(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
