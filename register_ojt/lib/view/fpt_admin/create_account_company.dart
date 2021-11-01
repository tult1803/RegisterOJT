import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/fpt_admin/create_account_company.dart';

class CreateAccountCompany extends StatefulWidget {
  int? id;
  String? companyName;
  CreateAccountCompany({this.id, this.companyName});

  @override
  _CreateAccountCompanyState createState() => _CreateAccountCompanyState();
}

class _CreateAccountCompanyState extends State<CreateAccountCompany> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        headerCenter(context),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size.width * 0.5,
          height: size.height * 0.9,
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
          child: CreateAccountData(
            id: widget.id,
            companyName: widget.companyName,
          ),
        ),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
