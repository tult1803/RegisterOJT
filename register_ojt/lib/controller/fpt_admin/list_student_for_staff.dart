import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/model/get/get_list_student_for_staff.dart';
import 'package:register_ojt/model/model_student_application_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/fpt_admin/ojt_student_details.dart';
import 'package:register_ojt/view/home_page.dart';

class ListStudentForStaffData extends StatefulWidget {

  String? token;

  ListStudentForStaffData({this.token});

  @override
  _ListStudentForStaffDataState createState() => _ListStudentForStaffDataState();
}

class _ListStudentForStaffDataState extends State<ListStudentForStaffData> {
  List<ListStudentForStaff>? data;

  getData() async {
    ListStudentsForStaff listStudentsForStaff = ListStudentsForStaff();
    data = await listStudentsForStaff.getListStudentForStaff();
    //   (
    //     token: await getDataSession(key: "token")
    // );
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
            //print(data);
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                String formattedDate = DateFormat('MM:HH dd/MM/yyyy').format(
                    data![index].updateDate as DateTime);
                return containerInfo(
                  appId: data![index].id,
                  studentCode: data![index].studentCode,
                  fullname: data![index].fullname,
                  gpa: data![index].gpa,
                  updateDate: formattedDate,
                  status: data![index].status,
                  companyName: data![index].companyName,
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
      {appId, studentCode, fullname, gpa, updateDate, status, companyName}) {
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
                "$studentCode - $fullname",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              SizedBox(height: 5,),
              Text('$status', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: getStatusColor(status)
              ),)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(
                    "GPA: $gpa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Company request: $companyName",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OjtStudentDetails(id: appId,)));
                },
                child: Text(
                  "Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      left: 25, right: 25, top: 15, bottom: 15)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  //MaterialStateProperty.all<Color>(Colors.orange.shade600)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
