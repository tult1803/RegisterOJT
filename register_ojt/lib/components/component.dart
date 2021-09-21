import 'package:flutter/material.dart';

Widget containerProfile(size, {String? title, String? content,  bool? showBottom}) {
  return Container(
    height: 80,
    width: size.width,
    child: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: size.width * 0.2,
                  child: Text("$title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              Expanded(child: Container(child: Text("$content", style: TextStyle(color: Colors.black54, fontSize: 20),))),
            ],
          ),
        ),
        SizedBox(child: showBottom == null ? Container(margin: EdgeInsets.only(left: 20, right: 20),color: Colors.black45,height: 0.5,) : null),
      ],
    ),
  );
}

