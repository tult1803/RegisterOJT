import 'dart:ui';

import 'package:flutter/material.dart';

class OjtInfor extends StatefulWidget {
  @override
  _OjtInforState createState() => _OjtInforState();
}

class _OjtInforState extends State<OjtInfor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: size.height,
      width: size.width * 0.6,
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
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          containerInfo(
              major: "SE",
              company: "Công Ty Thương Mại Điện Tử Magezon",
              content:
                  "Thực tập sinh Backend Engineer (PHP/Nodejs/C#/Java/Ruby/Go)",
              salary: "Thỏa thuận",
              location: "TP. Hồ Chí Minh",
              deadline: "20/09/2021"),
          containerInfo(
              major: "AI",
              company: "Công Ty Thương Mại Điện Tử Magezon",
              content:
              "Thực tập sinh Python",
              salary: "Thỏa thuận",
              location: "Quận 9",
              deadline: "25/09/2021"),
          containerInfo(
              major: "SS",
              company: "CÔNG TY TNHH MONEY FORWARD VIỆT NAM",
              content:
              "Nhân Viên Tư Vấn Bán Hàng",
              salary: "Thỏa thuận",
              location: "TP. Hồ Chí Minh",
              deadline: "30/09/2021"),
        ],
      ),
    );
  }

  Widget containerInfo(
      {String? major, content, company, salary, location, deadline}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      height: 100,
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
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {},
        child: Row(
          children: [
            Container(
              width: 100,
              child: Center(
                  child: Text(
                "$major",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$content",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$company",
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            "Lương: $salary",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Khu vực: $location",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              child: Text(
                "Hạn: $deadline",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
