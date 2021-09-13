import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/utils/google_login.dart';
import 'package:register_ojt/view/home_page.dart';
import 'package:register_ojt/view/student/send_application.dart';

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
      // home: LoginPage(),
      // home: HomePage(role: 0,),
      home: SendApplication(),
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
    "FU-Hòa Lạc",
    "FU-Hồ Chí Minh",
    "FU-Đà Nẵng",
    "FU-Cần Thơ",
    "FU-Quy Nhơn"
  ];
  String? dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
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
      ),
    );
  }

  Widget _dropDownButton() {
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        hint: Text("FU-Hồ Chí Minh"),
        items: listCampus.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropDownValue = value;
          });
        },
      ),
    );
  }

  Widget _googleSignIn() {
    return GestureDetector(
      onTap: () async {
        try {
          String? fbToken = await signIn();
          setDataSession(key: "token", value: fbToken!);
          print('Firebase Token saved !!!');
          int role = 0;
          /// Navigator tạm thời chờ API
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage(role: role,)),
              (route) => false);

        } catch (_) {
          EasyLoading.showError("Login Failed",
              maskType: EasyLoadingMaskType.black,
              duration: Duration(seconds: 2));
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
