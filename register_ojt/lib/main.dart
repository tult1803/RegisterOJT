import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:register_ojt/model/post/post_login.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/utils/google_login.dart';
import 'package:register_ojt/view/fpt_admin/company_feedback.dart';
import 'package:register_ojt/view/fpt_admin/view_all_student.dart';
import 'package:register_ojt/view/home_page.dart';
import 'package:register_ojt/view/student/profile.dart';
import 'package:register_ojt/view/company/view__all_application.dart';

import 'components/component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = colorHexa("7265fa")
    ..backgroundColor = Colors.white
    ..indicatorColor = colorHexa("7265fa")
    ..textColor = Colors.black87
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: AllStudent(),
      // home: HomePage(role: 0,),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var listCampus = [
    "Sinh viên",
    "FU-Staff",
    "Doanh Nghiệp",
  ];
  String? dropDownValue;
  int? roleValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue = "Sinh viên";
    roleValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          header(context),
          Expanded(child: body(context)),
          footer(context,
              content:
                  "Sinh viên cần hỗ trợ vui lòng liên hệ điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 90,
        color: Colors.orangeAccent,
        child: Container(
          margin: EdgeInsets.only(left: 30),
          alignment: Alignment.center,
          width: size.width,
          child: Image.asset("images/fpt_logo.png"),
        ));
  }

  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Login",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 30)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 30),
                child: _dropDownButton(),
              ),
              _googleSignIn(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dropDownButton() {
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        items: listCampus.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropDownValue = value;
            switch (value) {
              case "Sinh viên":
                roleValue = 0;
                break;
              case "FU-Staff":
                roleValue = 1;
                break;
              case "Doanh Nghiệp":
                roleValue = 2;
                break;
              default:
                roleValue = -1;
                break;
            }
          });
        },
      ),
    );
  }

  checkLogin({firebaseToken, role}) async {
    PostLogin postLogin = PostLogin();
    var status =
        await postLogin.login(firebaseToken: firebaseToken, role: role);
    return status;
  }

  Widget _googleSignIn() {
    return GestureDetector(
      onTap: () async {
        try {
          loadingLoad(status: "Processing...");
          String? fbToken = await signIn();
          if (await checkLogin(firebaseToken: fbToken, role: roleValue) ==
              200) {
            EasyLoading.dismiss();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          role: roleValue!,
                        )),
                (route) => false);
          } else {
            loadingFail(
                status:
                    "Login Failed - ${await checkLogin(firebaseToken: fbToken, role: roleValue)}");
          }
        } catch (e) {
          loadingFail(status: "Login Failed !!! \n $e");
        }
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 4,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image(image: AssetImage("images/google.png"), fit: BoxFit.fill),
            Flexible(
                child: Center(
                    child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  decoration: TextDecoration.none),
            ))),
          ],
        ),
      ),
    );
  }
}
