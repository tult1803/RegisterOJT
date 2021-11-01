import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:register_ojt/controller/student/ojt_infor.dart';

class OjtInfor extends StatefulWidget {
  @override
  _OjtInforState createState() => _OjtInforState();
}

class _OjtInforState extends State<OjtInfor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: size.height * 0.88,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: OJTInfors(),
    );
  }
}
