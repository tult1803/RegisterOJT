import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_evaluation_detail.dart';
import 'package:register_ojt/model/put/put_edit_evaluation.dart';
import 'package:register_ojt/view/company/evaluation_detail_company.dart';

class EditEvaluationData extends StatefulWidget {
  String? studentID, studentName;

  EditEvaluationData({this.studentID, this.studentName});

  @override
  _EditEvaluationDataState createState() => _EditEvaluationDataState();
}

class _EditEvaluationDataState extends State<EditEvaluationData> {
  String? inputData, division, description, lineManagerName;
  double? mark;
  int? position, onWorkDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    setState(() {});
  }

  editEvaluationStudent() async {
    try {
      EditEvaluationStudent editEva = EditEvaluationStudent();
      int status = await editEva.editEvaluationStudent(
          studentCode: widget.studentID,
          description: description,
          mark: mark,
          onWorkDate: onWorkDate,
          division: division,
          lineManagerName: lineManagerName);
      if (status == 200) {
        loadingSuccess(status: "Edit Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Edit Evaluation Failed !!!");
    } catch (e) {
      loadingFail(status: "$e");
    }
    return false;
  }

  inputEvaData() {
    switch (position) {
      case 1:
        division = inputData;
        break;
      case 2:
        mark = double.parse("$inputData");
        break;
      case 3:
        onWorkDate = int.parse("$inputData");
        break;
      case 4:
        lineManagerName = inputData;
        break;
      case 5:
        description = inputData;
        break;
    }
  }

  Widget _evaDetails(size, String label, String info) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.15,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            width: size.width * 0.3,
            child: Text(
              info,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editDetails(size, String label, String? hintText, int? pos) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.15,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            width: size.width * 0.3,
            child: TextField(
              style: TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  inputData = value;
                  position = pos;
                  inputEvaData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget btnSave() {
    return ElevatedButton(
      onPressed: () async {
        if (mark != null &&
            onWorkDate != null &&
            division != null &&
            lineManagerName != null &&
            description != null) {
          bool checkEdit = await editEvaluationStudent();
          if (checkEdit) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EvalutionDetail(
                      studentID: widget.studentID,
                      studentName: widget.studentName,
                    )));
          } else
            print("Failed");
        }
      },
      child: Text(
        "Save",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade600),
      ),
    );
  }

  Widget btnCancel() {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        "Cancel",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        leading: leadingAppbar(context, colorIcon: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Edit Evaluation",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaDetails(size, "MSSV:", "${widget.studentID ?? ""}"),
                _evaDetails(
                    size, "Student's name:", "${widget.studentName ?? ""}"),
                _editDetails(
                    size, "Position:", "Input student's position(FE, BE)", 1),
                _editDetails(size, "Grade Evaluation:", "Evaluate mark", 2),
                _editDetails(
                    size, "Working Date:", "Input total working date", 3),
                _editDetails(
                    size, "Manager's name:", "Input manager's name", 4),
                _editDetails(size, "Decription:", "Description for student", 5),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btnSave(),
                SizedBox(
                  width: 200,
                ),
                btnCancel()
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
