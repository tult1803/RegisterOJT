import 'package:flutter/material.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({Key? key}) : super(key: key);

  @override
  _ViewApplicationState createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("View Application"),);
  }
}
