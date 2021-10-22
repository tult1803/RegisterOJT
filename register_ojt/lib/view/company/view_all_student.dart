import 'package:flutter/material.dart';
import 'package:register_ojt/controller/company/view_all_student.dart';
import 'package:register_ojt/utils/helpers.dart';

class EvaluateStudent extends StatefulWidget {
  const EvaluateStudent({Key? key}) : super(key: key);

  @override
  _EvaluateStudentState createState() => _EvaluateStudentState();
}

class _EvaluateStudentState extends State<EvaluateStudent> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 15),
          width: size.width * 0.5,
          height: size.height * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: AllStudentData(
            token: token,
          )),
    );
  }
}
