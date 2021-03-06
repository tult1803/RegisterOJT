import 'package:flutter/material.dart';
import 'package:register_ojt/controller/fpt_admin/view_all_account.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/view/fpt_admin/create_account_company.dart';

class AllAccount extends StatefulWidget {
  int? id;
  String? companyName;

  AllAccount({this.id, this.companyName});

  @override
  _AllAccountState createState() => _AllAccountState();
}

class _AllAccountState extends State<AllAccount> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        headerCenter(context),
        Stack(
          children: [
            Positioned(
              right: 0,
              width: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(top: 15),
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateAccountCompany(
                                id: widget.id,
                                companyName: widget.companyName,
                              )));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70),
              height: size.height * 0.8,
              width: size.width * 0.5,
              child: AllAccountData(
                id: widget.id,
              ),
            ),
          ],
        ),
        footer(context,
            content:
                "Sinh vi??n c???n h??? tr??? vui l??ng li??n h??? Trung t??m D???ch v??? Sinh vi??n t???i Ph??ng 202, ??i???n tho???i : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
