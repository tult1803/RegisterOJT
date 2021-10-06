import 'package:flutter/material.dart';

class ApplicationDetailCompany extends StatefulWidget {
  const ApplicationDetailCompany({Key? key}) : super(key: key);

  @override
  _ApplicationDetailCompanyState createState() =>
      _ApplicationDetailCompanyState();
}

class _ApplicationDetailCompanyState extends State<ApplicationDetailCompany> {
  Widget details(String label, String info) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        width: size.width * 0.5,
        height: size.height * 0.9,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Application Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
              SizedBox(
                height: 20,
              ),
              details("Name:     ", "Nguyễn Đức Thắng"),
              details("MSSV:     ", "SE130157"),
              details("Email:      ", "thangnguyen123@gmail.com"),
              details("Position: ", "Web Developer"),
              details("GPA:        ", "8.0"),
              details("CV:          ", "Click to show"),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Approved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade600),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Denied",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
