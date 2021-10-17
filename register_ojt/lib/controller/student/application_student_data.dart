import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:register_ojt/model/get/get_application_student.dart';
import 'package:register_ojt/model/model_application_student.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/home_page.dart';

class AppStudentData extends StatefulWidget {
  String? token;


  AppStudentData({this.token});

  @override
  _AppStudentDataState createState() => _AppStudentDataState();
}

class _AppStudentDataState extends State<AppStudentData> {
  List<ApplicationStudent>? data;

  getData() async{
    ApplicationStudents applicationStudents = ApplicationStudents();
    data = await applicationStudents.getApplication(studentCode: stuCode);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              String formattedDate = DateFormat('MM:HH dd/MM/yyyy').format(data![index].updateDate as DateTime);
              return containerInfo(
                id: data![index].studentCode,
                name: data![index].studentName,
                applyTo: data![index].companyName,
                applyDate: formattedDate,
                status: data![index].status,
                topic: data![index].topic,
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget containerInfo({id, name, applyDate, applyTo, status, topic}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
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
      child: FlatButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(
                            "${id ?? "---"} - ${name ?? "---"}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 40,
                          child: Text(
                            "${applyDate ?? "---"}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Topic: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${topic ?? "---"}",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Apply to: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${applyTo ?? "---"}",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Text(
                        "Status:  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      child: Text(
                        "$status",
                        style: TextStyle(
                            fontSize: 16, color: getStatusColor(status)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
