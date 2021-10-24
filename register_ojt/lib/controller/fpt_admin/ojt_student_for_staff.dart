import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_ojt_student_for_staff.dart';
import 'package:register_ojt/model/model_ojt_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';

class OjtStudentForStaffData extends StatefulWidget {
  int? id;


  OjtStudentForStaffData({this.id});

  @override
  _OjtStudentForStaffDataState createState() => _OjtStudentForStaffDataState();
}

class _OjtStudentForStaffDataState extends State<OjtStudentForStaffData> {
  DetailOJTStudentForStaff? data;

  getData() async{
    DetailStudentForStaff applicationStudents = DetailStudentForStaff();
    data = await applicationStudents.getDetailStudentsForStaff(id: widget.id);
    print(widget.id);
    setState(() {

    });
    if(data == null) return List.empty();
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size.width,
          child: Center(
              child: Text(
                "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(
          height: 30,
        ),
        containerRecruiment(size,
            title: "MSSV:",
            content: "${data?.studentCode}"),
        containerRecruiment(size,
            title: "Họ và Tên:",
            content: "${data?.fullname}"),
        containerRecruiment(size,
            title: "Chuyên Ngành:", content: "${data?.majorName}"),
        containerRecruiment(size,
            title: "Email:",
            content: "${data?.email}"),
        containerRecruiment(size,
            title: "GPA:",
            content: "${data?.gpa}"),
        containerRecruiment(size,
            title: "Company Request:",
            content: "${data?.companyName}"),
        containerRecruiment(size,
            title: "CV:",
            content: "${data?.cv}",
            showBottom: true),
      ],
    );
  }
}