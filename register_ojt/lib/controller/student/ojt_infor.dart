import 'package:flutter/material.dart';
import 'package:register_ojt/model/get/get_ojt_infor.dart';
import 'package:register_ojt/model/model_ojt_information.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/student/recruitment_detail.dart';

class OJTInfors extends StatefulWidget {
  const OJTInfors({Key? key}) : super(key: key);

  @override
  _OJTInforState createState() => _OJTInforState();
}

class _OJTInforState extends State<OJTInfors> {
  List<OjtInfomation>? list;

  getData() async{
    GetOJTInfo getOJTInfo = GetOJTInfo();
    list = await getOJTInfo.getData(token: await getDataSession(key: "token"));
    if(list == null) return List.empty();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(list?.length != null) {
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                return containerInfo(
                  marginTop: index == 0 ? true : null,
                  id: list![index].id,
                  company: list![index].companyName,
                  content: list![index].topic,
                  deadline: "${list![index].deadline!.substring(0, 10)}",
                  location: list![index].area,
                  major: list![index].majorName,
                  salary: list![index].salary,
                );
              },
            );
          }else{
            return Center(
              child: Text("Data is empty !!!")
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget containerInfo(
      {id, String? major, content, company, salary, location, deadline, bool? marginTop}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: marginTop == true ? 20 : 0),
      height: 100,
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
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecruimentDetail(id: '$id', title: "$content",)));
        },
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$company",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            "L????ng: $salary",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Khu v???c: $location",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                "H???n: $deadline",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
