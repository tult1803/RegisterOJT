import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
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

  Color getColor(String data) {
    switch (data) {
      case "Working":
        return Colors.green;
      case "Finished":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Widget _info(String label, String data) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
              text: label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          TextSpan(
              text: data,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: getColor(data))),
        ],
      ),
    );
  }

  Widget _student(String name, String mssv, String position, String status,
      String startDate) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_info("Name: ", name), _info("MSSV: ", mssv)],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Position: ", position),
              _info("Status: ", status)
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Start Date: ", startDate),
            ],
          ),
        ],
      ),
    );
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _student("Nguyễn Đức Thắng", "SE130157", "Web Developer",
                      "Working", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Nguyễn Đức Thắng", "SE130157", "Web Developer",
                      "Finished", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Lê Thanh Tú", "SE130157", "Web Developer",
                      "Working", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Nguyễn Đức Thắng", "SE130157", "Web Developer",
                      "Working", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Lê Thanh Tú", "SE130157", "Web Developer",
                      "Finished", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Đoàn Quang Huy", "SE130157", "Web Developer",
                      "Working", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  _student("Đoàn Quang Huy", "SE130157", "Web Developer",
                      "Working", "17/10/2021"),
                ],
              ),
            )));
  }
}
