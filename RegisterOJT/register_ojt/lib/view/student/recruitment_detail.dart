import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/view/student/send_application.dart';

class RecruimentDetail extends StatefulWidget {
  String? id;

  RecruimentDetail({this.id});

  @override
  _RecruimentDetailState createState() => _RecruimentDetailState();
}

class _RecruimentDetailState extends State<RecruimentDetail> {
  String? content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    content = "Thực tập sinh Backend Engineer (PHP/Nodejs/C#/Java/Ruby/Go)";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
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
          child: Scaffold(
            appBar: AppBar(
              leading: leadingAppbar(context, colorIcon: Colors.black87),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Registration Application",
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
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: size.width,
                    child: Center(
                        child: Text(
                      "${content ?? "-----"}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  containerRecruiment(size,
                      title: "Company:",
                      content: "Công Ty Thương Mại Điện Tử Magezon"),
                  containerRecruiment(size,
                      title: "Address:",
                      content: "312 Lạc Long Quân, P5, Q11, HCM"),
                  containerRecruiment(size,
                      title: "REQUIREMENTS FOR MAJORS:", content: "SE"),
                  containerRecruiment(size,
                      title: "Website of Company:",
                      content: "www.newwaymedia.vn"),
                  containerJobDescription(size,
                      title: "JOB DESCRIPTION:",
                      content: "- Project implementation skills"
                          "\n- Good communication"
                          "\n- Ability to effectively handle and solve problems"
                          "\n- Capable of teamwork"),
                  containerRecruiment(size,
                      title: "Salary:", content: "Thỏa thuận"),
                  containerRecruiment(size,
                      title: "EXPIRATION DATE:",
                      content: "20/09/2021",
                      showBottom: true),
                  btnApply(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnApply() {
    return Container(
      height: 40,
      width: 160,
      color: Colors.orangeAccent,
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (content) => SendApplication(idCompany: widget.id,)));
          },
          child: Text(
            "Apply Now",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
