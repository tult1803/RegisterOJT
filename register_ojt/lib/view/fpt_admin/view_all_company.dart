import 'package:flutter/material.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/controller/fpt_admin/view_all_company.dart';
import 'package:register_ojt/view/fpt_admin/create_company.dart';

class AllCompany extends StatefulWidget {
  const AllCompany({Key? key}) : super(key: key);

  @override
  _AllCompanyState createState() => _AllCompanyState();
}

class _AllCompanyState extends State<AllCompany> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
          child: Stack(
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
                        builder: (context) => CreateCompany()));
                  },
                  child: Text(
                    "Create Company",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 70),
              height: size.height * 0.8,
              width: size.width * 0.6,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AllCompanyData(
                token: token,
              )),
        ],
      )),
    );
  }
}
