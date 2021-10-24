import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/fpt_admin/ojt_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';

class OjtStudentDetails extends StatefulWidget {
  int? id;

  OjtStudentDetails({this.id});

  @override
  _OjtStudentDetailsState createState() => _OjtStudentDetailsState();
}

class _OjtStudentDetailsState extends State<OjtStudentDetails> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          headerCenter(context),
          Center(
            child: Container(
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
            ],
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: leadingAppbar(context, colorIcon: Colors.black87),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Thông tin sinh viên thực tập",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
            body: SingleChildScrollView(
                child: OjtStudentForStaffData(id: widget.id,)
            ),
          ),
          footer(context, content: "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
        ],
      ),
    );
  }

}
