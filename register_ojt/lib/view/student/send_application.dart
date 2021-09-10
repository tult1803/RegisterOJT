import 'package:flutter/material.dart';

class SendApplication extends StatefulWidget {
  const SendApplication({Key? key}) : super(key: key);

  @override
  _SendApplicationState createState() => _SendApplicationState();
}

class _SendApplicationState extends State<SendApplication> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Send Application"),);
  }
}
