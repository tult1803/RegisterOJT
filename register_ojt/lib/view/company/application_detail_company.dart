import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/company/application_detail_company.dart';

class ApplicationDetailCompany extends StatefulWidget {
  int? id;
  String? status;
  ApplicationDetailCompany({this.id, this.status});

  @override
  _ApplicationDetailCompanyState createState() =>
      _ApplicationDetailCompanyState();
}

class _ApplicationDetailCompanyState extends State<ApplicationDetailCompany> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        headerCenter(context),
        Container(
          margin: EdgeInsets.only(top: 15),
          width: size.width * 0.5,
          height: size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: ApplicationDetailData(
            id: widget.id,
            status: widget.status,
          ),
        ),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
