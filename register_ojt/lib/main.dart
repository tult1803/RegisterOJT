import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
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

  Widget _dropDownButton(){
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        hint: Text("Select Campus"),
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

  Widget _googleSignIn(){
    return GestureDetector(
      onTap: () {
        print('Tap Google Sign In - $dropDownValue');
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
          Flexible(child: Center(child: Text("Sign in", style: TextStyle(color: Colors.black87, fontSize: 15, decoration: TextDecoration.none),))),
        ],),
      ),
    );
  }
}
