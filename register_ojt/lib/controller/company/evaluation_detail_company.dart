import 'package:flutter/material.dart';
import 'package:register_ojt/model/company/model_evaluation_company.dart';
import 'package:register_ojt/view/company/edit_evaluation.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_evaluation_detail.dart';
import 'package:register_ojt/model/post/post_new_evaluation.dart';
import 'package:register_ojt/view/company/view_all_student.dart';
import 'package:register_ojt/view/home_page.dart';

class EvaluationDetailData extends StatefulWidget {
  String? studentID, studentName;

  EvaluationDetailData({this.studentID, this.studentName});

  @override
  _EvaluationDetailDataState createState() => _EvaluationDetailDataState();
}

class _EvaluationDetailDataState extends State<EvaluationDetailData> {
  Evaluation? data;
  String? inputData, division, description, lineManagerName;
  double? mark;
  int? position, onWorkDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    EvaluationDetail details = EvaluationDetail();
    data = await details.getDetail(idStudent: widget.studentID);
    setState(() {});
    return data;
  }

  newEvaluationStudent() async {
    try {
      PostNewEvaluation newEva = PostNewEvaluation();
      int status = await newEva.newEvaluationStudent(
          companyCode: stuCode,
          studentCode: widget.studentID,
          mark: mark,
          onWorkDate: onWorkDate,
          description: description,
          lineManagerName: lineManagerName,
          division: division);
      if (status == 200) {
        loadingSuccess(status: "Evaluate Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Evaluate Failed !!!");
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

  Widget btnEdit() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditEvaluation(
                    studentID: widget.studentID,
                    studentName: widget.studentName,
                  )),
        );
      },
      child: Text(
        "Edit",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.orange.shade600),
      ),
    );
  }

  Widget hasData(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        _evaDetails(size, "Name:", "${data?.name ?? ""}"),
        _evaDetails(size, "Position:", "${data?.position ?? ""}"),
        _evaDetails(size, "Grade Evaluation:", "${data?.mark ?? ""}"),
        _evaDetails(size, "Description:", "${data?.description ?? ""}"),
        _evaDetails(size, "Start Date:", "${data?.startDate ?? ""}"),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnEdit(),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _inputEvaDetails(size, String label, String? hintText, int? pos) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
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
            child: TextField(
              maxLines: 3,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: "$hintText",
                border: OutlineInputBorder(),
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
          bool checkCreate = await newEvaluationStudent();
          if (checkCreate) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(role: 2)));
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

  Widget newEva(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        _evaDetails(size, "MSSV:", "${widget.studentID ?? ""}"),
        _evaDetails(size, "Student's name:", "${widget.studentName ?? ""}"),
        _inputEvaDetails(
            size, "Position:", "Input student's position(FE, BE)", 1),
        _inputEvaDetails(size, "Grade Evaluation:", "Evaluate mark", 2),
        _inputEvaDetails(size, "Working Date:", "Input total working date", 3),
        _inputEvaDetails(size, "Manager's name:", "Input manager's name", 4),
        _inputEvaDetails(size, "Decription:", "Description for student", 5),
        SizedBox(
          height: 30,
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
          "Application Details",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: data == null ? newEva(size) : hasData(size),
      ),
    );
  }
}
