import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_statistic_dropbutton_value.dart';
import 'package:register_ojt/model/get/get_statistic_recruitment.dart';
import 'package:register_ojt/model/get/get_statistic_student.dart';
import 'package:register_ojt/model/model_statistic_recruitment.dart';
import 'package:register_ojt/model/model_statistic_student.dart';
import 'package:register_ojt/utils/helpers.dart';

class ViewStatistic extends StatefulWidget {
  // const ViewStatistic({Key? key}) : super(key: key);

  @override
  _ViewStatisticState createState() => _ViewStatisticState();
}

class _ViewStatisticState extends State<ViewStatistic> {
  var listSemester;
  var dropDownVal = [""];
  String? dropDownValue;
  int? showData = 0;
  List<StatisticRecruitment>? listRecruitment;
  List<StatisticStudent>? listStudent;

  getRecruitment() async {
    GetStatisticRecruitment getRecruitmentInfo = GetStatisticRecruitment();
    listRecruitment =
        await getRecruitmentInfo.getData(semesterName: dropDownValue);
    if (listRecruitment == null) return List.empty();
    return listRecruitment;
  }

  getStudent() async {
    GetStatisticStudent getStudentInfo = GetStatisticStudent();
    listStudent = await getStudentInfo.getData(semesterName: dropDownValue);
    if (listStudent == null) return List.empty();
    return listStudent;
  }

  Widget _dropDownButton() {
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        items: dropDownVal.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          print(value);
          dropDownValue = value;
          print(dropDownValue);
          switch (value) {
            case "Fall 2021":
              break;
            default:
              break;
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(dropDownValue);
    getData();
  }

  getData() async {
    GetStatisticDropButtonVal getSemesterVal = GetStatisticDropButtonVal();
    listSemester = await getSemesterVal.getListStatisticStatusVal();
    for (int i = 0; i < listSemester.length; i++) {
      dropDownVal.add(listSemester[i].name);
    }
    setState(() {});
  }

  Widget _btnStudent() {
    return ElevatedButton(
      onPressed: () {
        showData = 1;
        setState(() {});
      },
      child: Text(
        "Student",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.orange.shade600),
      ),
    );
  }

  Widget _showStudentData() {
    return FutureBuilder(
      future: getStudent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (listStudent?.length != null) {
            return ListView.builder(
              itemCount: listStudent!.length,
              itemBuilder: (context, index) {
                print (listStudent![0].startDate);

                return studentInfo(
                    marginTop: index == 0 ? true : null,
                    stuCode: listStudent![index].stuCode,
                    stuName: listStudent![index].stuName,
                    majorName: listStudent![index].majorName,
                    gpa: listStudent![index].gpa.toString(),
                    term: listStudent![index].term.toString(),
                    phone: listStudent![index].phone,
                    email: listStudent![index].email,
                    companyName: listStudent![index].companyName,
                    workingStatus: listStudent![index].workingStatus,
                    startDate:
                        "${listStudent![index].startDate?.substring(0, 10)}",
                    endDate:
                        "${listStudent![index].endDate?.substring(0, 10)}");
              },
            );
          } else {
            return Center(
                child: Text("There haven't had any student recently !!!"));
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget studentInfo(
      {String? stuCode,
      stuName,
      majorName,
      email,
      phone,
      term,
      gpa,
      companyName,
      startDate,
      endDate,
      workingStatus,
      bool? marginTop}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          left: 10, right: 10, bottom: 20, top: marginTop == true ? 20 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
                5: FlexColumnWidth(3),
                6: FlexColumnWidth(2),
                7: FlexColumnWidth(3),
                8: FlexColumnWidth(2),
                9: FlexColumnWidth(2),
                10: FlexColumnWidth(2),
              },
              border: TableBorder.all(color: Colors.black),
              children:
              [TableRow(children: [
                Text("StudentCode".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Full Name".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Major".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Term".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("GPA".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Email".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Phone".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Company".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("WorkingStatus".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("StartDate".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("EndDate".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                // you can have more properties of course
              ]),
                ...(listStudent == null ? [] as List : listStudent as List)
                    .map((item) => TableRow(children: [
                  Text(item.stuCode.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.stuName.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.majorName.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.gpa.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.term.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.email.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.phone.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.companyName.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.workingStatus.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(item.startDate)), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(item.endDate)), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  // you can have more properties of course
                ]))
                    .toList()]

          ),
        ],
      ),
    );
  }

  Widget _btnRecruitInfo() {
    return ElevatedButton(
      onPressed: () {
        showData = 2;
        setState(() {});
      },
      child: Text(
        "Recruitment",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.orange.shade600),
      ),
    );
  }

  Widget _showRecruitmentData() {
    return FutureBuilder(
      future: getRecruitment(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (listRecruitment?.length != null) {
            return ListView.builder(
              itemCount: listRecruitment!.length,
              itemBuilder: (context, index) {
                return recruitmentInfo(
                  marginTop: index == 0 ? true : null,
                  topic: listRecruitment![index].topic,
                  company: listRecruitment![index].companyName,
                  content: listRecruitment![index].content,
                  deadline:
                      "${listRecruitment![index].deadline?.substring(0, 10)}",
                  area: listRecruitment![index].area,
                  major: listRecruitment![index].majorName,
                  salary: listRecruitment![index].salary,
                );
              },
            );
          } else {
            return Center(
                child: Text("There haven't had any recruitment recently !!!"));
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget recruitmentInfo(
      {String? major,
      topic,
      content,
      company,
      salary,
      area,
      deadline,
      bool? marginTop}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          left: 10, right: 10, bottom: 20, top: marginTop == true ? 20 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(3),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(2),
              },
              border: TableBorder.all(color: Colors.black),
              children:
              [TableRow(children: [
                Text("Major".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Topic".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Company Name".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Address".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Content".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Salary".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                Text("Deadline".toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                // you can have more properties of course
              ]),
                ...(listRecruitment == null ? [] as List : listRecruitment as List)
                    .map((item) => TableRow(children: [
                  Text(item.majorName.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.topic.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.companyName.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.area.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.content.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(item.salary.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  Text(DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(item.deadline)), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ), textAlign: TextAlign.center),
                  // you can have more properties of course
                ]))
                    .toList()]

          ),
        ],
      ),
    );
  }

  getWidget() {
    if (showData == 1) {
      return _showStudentData();
    } else if (showData == 2) {
      return _showRecruitmentData();
    } else
      Text("There is no data recently");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        headerCenter(context),
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size.width * 0.8,
          height: size.height * 1.36,
          child: Scaffold(
            appBar: AppBar(
              leading: leadingAppbar(context, colorIcon: Colors.black87),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
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
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    width: size.width * 1.5,
                    height: size.height * 1.8,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _dropDownButton(),
                              Row(
                                children: [
                                  _btnStudent(),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  _btnRecruitInfo()
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          height: size.height,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orange.shade300),
                          child: Center(child: getWidget()),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // child: ,
            ),
          ),
        ),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
