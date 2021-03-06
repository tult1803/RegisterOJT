import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_ojt_student_for_staff.dart';
import 'package:register_ojt/model/model_ojt_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget containerRecruimentForMe(size,
      {String? title, String? content, bool? showBottom}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title ?? "-----"}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 8,
          ),
          Text("${content ?? "-----"}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800)),
          SizedBox(
              child: showBottom == null
                  ? Container(
                margin: EdgeInsets.only(top: 12),
                color: Colors.black45,
                height: 0.5,
              )
                  : null),
        ],
      ),
    );
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
        containerRecruimentForMe(size,
            title: "MSSV:",
            content: "${data?.studentCode}"),
        containerRecruimentForMe(size,
            title: "H??? v?? T??n:",
            content: "${data?.fullname}"),
        containerRecruimentForMe(size,
            title: "Chuy??n Ng??nh:", content: "${data?.majorName}"),
        containerRecruimentForMe(size,
            title: "Email:",
            content: "${data?.email}"),
        containerRecruimentForMe(size,
            title: "GPA:",
            content: "${data?.gpa}"),
        containerRecruimentForMe(size,
            title: "Company Request:",
            content: "${data?.companyName}"),
        showCV(cv: "${data?.cv}", size: size),
      ],
    );
  }

  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Widget showCV({cv, size}) {
    return Container(
      width: size.width * 0.4,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "CV: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          GestureDetector(
            onTap: () async {
              launchURL(cv);
            },
            child: Text(
              "Click to download",
              style: TextStyle(fontSize: 22, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}