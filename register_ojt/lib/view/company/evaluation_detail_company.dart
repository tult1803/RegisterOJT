import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';

class EvalutionDetail extends StatefulWidget {
  const EvalutionDetail({Key? key}) : super(key: key);

  @override
  _EvalutionDetailState createState() => _EvalutionDetailState();
}

class _EvalutionDetailState extends State<EvalutionDetail> {
  Widget _evaDetails(String label, String info) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  Widget btnEdit() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Edit",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.orange.shade600),
      ),
    );
  }

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
          child: Scaffold(
            backgroundColor: Colors.orange[200],
            appBar: AppBar(
              leading: leadingAppbar(context, colorIcon: Colors.black87),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Application Details",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  _evaDetails("Name:             ", "Nguyễn Đức Thắng"),
                  _evaDetails("Position:         ", "Web Developer"),
                  _evaDetails("Grade Evaluation: ", "8.0"),
                  _evaDetails("Description:      ", "Passion, work hard"),
                  _evaDetails("Start Date:       ", "17/10/2021"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnEdit(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
