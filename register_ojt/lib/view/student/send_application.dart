import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/student/send_applications.dart';
import 'package:register_ojt/utils/helpers.dart';

class SendApplication extends StatefulWidget {
  String? idCompany;

  SendApplication({this.idCompany});

  @override
  _SendApplicationState createState() => _SendApplicationState();
}

class _SendApplicationState extends State<SendApplication> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: [
            headerCenter(context),
            Container(
                  margin: EdgeInsets.only(top: 50),
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
                  child: SendApplications(idCompany: widget.idCompany,),
            ),
            footer(context, content: "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
          ],
        ));
  }
}
