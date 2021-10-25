import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/view/company/application_detail_company.dart';
import 'package:register_ojt/view/home_page.dart';
import 'package:register_ojt/model/company/model_application_company.dart';
import 'package:register_ojt/model/get/get_all_application.dart';
import 'package:register_ojt/utils/helpers.dart';

class AllApplicationData extends StatefulWidget {
  String? token;

  AllApplicationData({this.token});

  @override
  _AllApplicationDataState createState() => _AllApplicationDataState();
}

class _AllApplicationDataState extends State<AllApplicationData> {
  List<ApplicationCompany>? data;
  int? appID;

  getData() async {
    ApplicationCompanys applications = ApplicationCompanys();
    data = await applications.getApplication(companyCode: stuCode);
    if (data == null) return List.empty();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (data?.length != null && data?.length != 0) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                String formattedDate = DateFormat('MM:HH dd/MM/yyyy')
                    .format(data![index].registrationDate as DateTime);
                return _application(
                  appID: data![index].id,
                  id: data![index].studentCode,
                  name: data![index].studentName,
                  position: data![index].position,
                  status: data![index].status,
                  time: formattedDate,
                );
              },
            );
          } else {
            return Center(child: Text("Data is empty !!!"));
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget btnDetail(int? appID, String? status) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApplicationDetailCompany(
                    id: appID,
                    status: status,
                  )),
        );
      },
      child: Text(
        "Detail",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.orange.shade600),
      ),
    );
  }

  Widget _application({appID, id, name, position, status, time}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
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
                "${id ?? "---"} - ${name ?? "---"}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "${time ?? "---"}",
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
                    "Position: " + "${position ?? "---"}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            text: 'Status: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        TextSpan(
                            text: "$status",
                            style: TextStyle(
                                color: getStatusColor(status),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
              btnDetail(appID, status),
            ],
          ),
        ],
      ),
    );
  }
}
