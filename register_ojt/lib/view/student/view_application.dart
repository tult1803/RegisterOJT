import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_ojt/controller/student/application_student_data.dart';
import 'package:register_ojt/utils/helpers.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({Key? key}) : super(key: key);

  @override
  _ViewApplicationState createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
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
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: size.height * 0.76,
      width: size.width * 0.6,
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
     child: AppStudentData(token: token,),
    );
  }
}
