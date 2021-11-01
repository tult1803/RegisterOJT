import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/model/company/model_student_company.dart';
import 'package:register_ojt/model/get/get_all_student.dart';
import 'package:register_ojt/view/company/evaluation_detail_company.dart';
import 'package:register_ojt/view/home_page.dart';
import 'package:register_ojt/utils/helpers.dart';

class AllStudentData extends StatefulWidget {
  String? token;

  AllStudentData({this.token});

  @override
  _AllStudentDataState createState() => _AllStudentDataState();
}

class _AllStudentDataState extends State<AllStudentData> {
  List<StudentCompany>? data;

  getData() async {
    StudentsCompany applications = StudentsCompany();
    data = await applications.getStudent(companyCode: stuCode);
    if (data == null) return List.empty();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (data?.length != null && data?.length != 0) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                String formattedStartDate = DateFormat('MM:HH dd/MM/yyyy')
                    .format(data![index].startDate as DateTime);
                // String formattedEndDate = DateFormat('MM:HH dd/MM/yyyy')
                //     .format(data![index].endDate as DateTime);
                return _student(
                  id: data![index].studentCode,
                  name: data![index].studentName,
                  position: data![index].position,
                  status: data![index].status,
                  startDate: formattedStartDate,
                  // endDate: formattedEndDate,
                );
              },
            );
          } else {
            return Center(child: Text("Data is empty !!!"));
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: getStatusColor(data))),
        ],
      ),
    );
  }

  Widget _student({name, id, position, status, startDate}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EvalutionDetail(
            studentID: id,
            studentName: name,
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info("Name: ", "${name ?? "---"}"),
                _info("MSSV: ", "${id ?? "---"}")
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info("Position: ", "${position ?? "---"}"),
                _info("Status: ", "${status ?? "---"}")
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info("Start Date: ", "${startDate ?? "---"}"),
                //_info("End Date: ", "${endDate ?? "Not Finish"}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
