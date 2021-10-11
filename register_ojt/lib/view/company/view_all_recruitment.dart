import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_ojt/controller/company/recruiment_company.dart';
import 'package:register_ojt/view/company/create_recruiment.dart';

class AllRecruitment extends StatefulWidget {
  const AllRecruitment({Key? key}) : super(key: key);

  @override
  _AllRecruitmentState createState() => _AllRecruitmentState();
}

class _AllRecruitmentState extends State<AllRecruitment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Stack(
      children: [
        Positioned(
          right: 0,
          width: 150,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            color: Colors.orangeAccent,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateRecruiment()));
                },
                child: Text(
                  "New Recruitment",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 70),
            height: size.height * 0.8,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: RecruimentCompany()
        ),
      ],
    );
  }
}