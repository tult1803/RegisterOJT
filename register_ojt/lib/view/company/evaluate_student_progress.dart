import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/company/evaluation_detail_company.dart';

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
                  color: getStatusColor(data))),
        ],
      ),
    );
  }

  Widget _student(String name, String id, String position, String status,
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
            children: [_info("Name: ", name), _info("MSSV: ", id)],
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EvalutionDetail(),));
      },
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
                _student("Nguy???n ?????c Th???ng", "SE130157", "Web Developer",
                    "Working", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("Nguy???n ?????c Th???ng", "SE130157", "Web Developer",
                    "Finished", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("L?? Thanh T??", "SE130157", "Web Developer",
                    "Working", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("Nguy???n ?????c Th???ng", "SE130157", "Web Developer",
                    "Working", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("L?? Thanh T??", "SE130157", "Web Developer",
                    "Finished", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("??o??n Quang Huy", "SE130157", "Web Developer",
                    "Working", "17/10/2021"),
                SizedBox(
                  height: 30,
                ),
                _student("??o??n Quang Huy", "SE130157", "Web Developer",
                    "Working", "17/10/2021"),
              ],
            ),
          )),
    );
  }
}
