import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_statistic_dropbutton_value.dart';
import 'package:register_ojt/model/get/get_statistic_recruitment.dart';
import 'package:register_ojt/model/model_statistic_recruitment.dart';

class ViewStatistic extends StatefulWidget {
  // const ViewStatistic({Key? key}) : super(key: key);

  @override
  _ViewStatisticState createState() => _ViewStatisticState();
}

class _ViewStatisticState extends State<ViewStatistic> {
  var listSemester;
  var dropDownVal = [""];
  String? dropDownValue;
  int? showData;
  List<StatisticRecruitment>? listRecruitment;

  getRecruitment() async {
    GetStatisticRecruitment getInfo = GetStatisticRecruitment();
    listRecruitment = await getInfo.getData(semesterName: dropDownValue);
    if (listRecruitment == null) return List.empty();
    return listRecruitment;
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
        showData = 0;
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

  Widget _btnRecruitInfo() {
    return ElevatedButton(
      onPressed: () {
        showData = 1;
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
                  content: listRecruitment![index].topic,
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
          Center(
            child: Text(
              "$major - $topic",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Company's name: $company",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Address: $area",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Content: $content",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Salary: $salary",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Deadline: $deadline",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  getWidget() {
    if (showData == 0) {
      return Text("Student here");
    } else if (showData == 1) {
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
                          ),
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
