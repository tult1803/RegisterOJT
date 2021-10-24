import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/model/get/get_company_report_for_staff.dart';
import 'package:register_ojt/model/model_company_report_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/home_page.dart';

class ListCompanyReportForStaffData extends StatefulWidget {

  String? token;

  ListCompanyReportForStaffData({this.token});

  @override
  _ListCompanyReportForStaffDataState createState() => _ListCompanyReportForStaffDataState();
}

class _ListCompanyReportForStaffDataState extends State<ListCompanyReportForStaffData> {
  List<CompanyReportForStaff>? data;

  getData() async {
    ListReportsForStaff listStudentsForStaff = ListReportsForStaff();
    data = await listStudentsForStaff.getListReportsForStaff();
    if (data == null) return List.empty();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (data?.length != null) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                String formattedDate = DateFormat('MM:HH dd/MM/yyyy').format(
                    data![index].publicDate as DateTime);
                return containerInfo(
                  workSortDescription: data![index].workSortDescription,
                  studentCode: data![index].studentCode,
                  mark: data![index].mark,
                  studentName: data![index].studentName,
                );
              },
            );
          } else {
            return Center(
                child: Text("Data is empty !!!")
            );
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget containerInfo(
      {publicDate, workSortDescription, studentCode, mark, studentName}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$studentCode - ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Grade: $mark",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$studentName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Note: $workSortDescription",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
