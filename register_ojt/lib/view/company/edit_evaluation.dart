import 'package:flutter/material.dart';
import 'package:register_ojt/controller/company/edit_evaluation.dart';

class EditEvaluation extends StatefulWidget {
  String? studentID, studentName;

  EditEvaluation({this.studentID, this.studentName});

  @override
  _EditEvaluationState createState() => _EditEvaluationState();
}

class _EditEvaluationState extends State<EditEvaluation> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Center(
            child: Container(
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
                child: EditEvaluationData(
                  studentID: widget.studentID,
                  studentName: widget.studentName,
                ))));
  }
}
