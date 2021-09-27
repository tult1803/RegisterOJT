import 'package:flutter/material.dart';
import 'package:register_ojt/utils/helpers.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({Key? key}) : super(key: key);

  @override
  _ViewApplicationState createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    token = await getDataSession(key: "token");
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("$token"),);
  }
}
