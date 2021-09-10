import 'package:flutter/material.dart';
import 'package:register_ojt/utils/google_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/student/ojt_information.dart';
import 'package:register_ojt/view/student/profile.dart';
import 'package:register_ojt/view/student/send_application.dart';
import 'package:register_ojt/view/student/view_application.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget _widget;
  String? currentNamePage;
  var token;

  _getToken() async {
    token = await getDataSession(key: "token");
    setState(() {
      token = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentNamePage = "OJT Information";
    _widget = OjtInfor();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          topBar(context),
          Container(
            child: _widget,
          ),
        ],
      ),
    );
  }

  Widget miniContainer(String title,
      {required bool isHiddenColor, required int index}) {
    return Container(
      decoration: BoxDecoration(
          color: isHiddenColor == true ? Colors.orangeAccent : Colors.white54,
          borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: 150,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          setState(() {
            currentNamePage = title;
            switch (index) {
              case 0:
                _widget = OjtInfor();
                break;
              case 1:
                _widget = SendApplication();
                break;
              case 2:
                _widget = ViewApplication();
                break;
              case 3:
                _widget = ProfileStudent();
                break;
              case 4:
                signOut(context);
                break;
            }
          });
        },
        child: Center(
            child: Text(
          "$title",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),
        )),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: size.width * 0.3,
            child: Text(
              "SE130223 - Lê Thanh Tú | $currentNamePage",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              child: Wrap(
                spacing: 10,
                children: [
                  miniContainer("OJT Information",
                      isHiddenColor: false, index: 0),
                  miniContainer("Send Application",
                      isHiddenColor: false, index: 1),
                  miniContainer("View Application",
                      isHiddenColor: false, index: 2),
                  miniContainer("Profile",
                      isHiddenColor: false, index: 3),
                  miniContainer("Logout",
                      isHiddenColor: true, index: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
