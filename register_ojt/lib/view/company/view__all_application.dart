import 'package:flutter/material.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/components/component.dart';
import 'application_detail_company.dart';

class AllApplications extends StatefulWidget {
  const AllApplications({Key? key}) : super(key: key);

  @override
  _AllApplicationsState createState() => _AllApplicationsState();
}

class _AllApplicationsState extends State<AllApplications> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  Widget _application() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SE130157 - Nguyễn Đức Thắng",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "14/09/2021 15:30",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Position: Web Developer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Status: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(
                            text: "Approved",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApplicationDetailCompany()),
                  );
                },
                child: Text(
                  "Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.only(
                      left: 25, right: 25, top: 15, bottom: 15)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange.shade600),
                ),
              )
            ],
          )
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
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                  SizedBox(
                    height: 20,
                  ),
                  _application(),
                ],
              ),
            )));
  }
}
