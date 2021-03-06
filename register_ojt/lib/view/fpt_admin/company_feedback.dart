import 'package:flutter/material.dart';
import 'package:register_ojt/controller/fpt_admin/company_report_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';

class FeedBackCompany extends StatefulWidget {
  const FeedBackCompany({Key? key}) : super(key: key);

  @override
  _FeedBackCompanyState createState() => _FeedBackCompanyState();
}

class _FeedBackCompanyState extends State<FeedBackCompany> {
  // String? token;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }
  //
  // getData() async {
  //   token = await getDataSession(key: "token");
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.fromLTRB(40, 15, 40, 10),
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
            ]
        ),
        child: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(30, 15, 30, 50),
              width: size.width * 0.8,
              height: size.height * 1.4,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListCompanyReportForStaffData(),
          ),
        ),
    );
  }
}
