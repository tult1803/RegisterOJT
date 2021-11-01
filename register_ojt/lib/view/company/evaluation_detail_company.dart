import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/company/evaluation_detail_company.dart';

class EvalutionDetail extends StatefulWidget {
  String? studentID, studentName;

  EvalutionDetail({this.studentID, this.studentName});

  @override
  _EvalutionDetailState createState() => _EvalutionDetailState();
}

class _EvalutionDetailState extends State<EvalutionDetail> {
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
            child: EvaluationDetailData(
                studentID: widget.studentID, studentName: widget.studentName)),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
