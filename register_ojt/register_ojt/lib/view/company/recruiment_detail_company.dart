import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/delete/delete_recruiment.dart';
import 'package:register_ojt/model/get/recruiments_detail.dart';
import 'package:register_ojt/model/model_recruiment_detail.dart';
import 'package:register_ojt/view/home_page.dart';

class RecruimentDetailCompany extends StatefulWidget {
  String? id, content;

  RecruimentDetailCompany({this.id, this.content});

  @override
  _RecruimentDetailCompanyState createState() =>
      _RecruimentDetailCompanyState();
}

class _RecruimentDetailCompanyState extends State<RecruimentDetailCompany> {
  RecruiDetail? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      loadingLoad(status: "Loading...");
      RecDetail detail = RecDetail();
      data = await detail.getDetail(widget.id);
      EasyLoading.dismiss();
      setState(() {});
    } catch (e) {
      loadingFail(status: "Failed to load data !!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          width: size.width * 0.5,
          height: size.height * 0.9,
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
          child: Scaffold(
            appBar: AppBar(
              leading: leadingAppbar(context, colorIcon: Colors.black87),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Recruitment Details",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: size.width,
                    child: Center(
                        child: Text(
                      "${widget.content ?? "-----"}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  containerRecruiment(size,
                      title: "Company:",
                      content: "${data?.companyName ?? "-----"}"),
                  containerRecruiment(size,
                      title: "Address:",
                      content: "${data?.address ?? "-----"}"),
                  containerRecruiment(size,
                      title: "Requirements for majors:",
                      content: "${data?.majorName ?? "-----"}"),
                  containerRecruiment(size,
                      title: "Company's website:",
                      content: "${data?.companyWebsite ?? "-----"}"),
                  containerJobDescription(size,
                      title: "Job Description:",
                      content: "${data?.content ?? "-----"}"),
                  containerRecruiment(size,
                      title: "Salary:", content: "${data?.salary ?? "-----"}"),
                  containerRecruiment(size,
                      title: "Expired Date:",
                      content: "${data?.deadline ?? "-----"}",
                      showBottom: true),
                  btnDelete(context, id: widget.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnDelete(context, {id}) {
    return Container(
      height: 40,
      width: 160,
      color: Colors.orangeAccent,
      child: TextButton(
          onPressed: () async {
            try {
              DeleteRecruiments deleteRecruiments = DeleteRecruiments();
              int status =
                  await deleteRecruiments.detele(id: id, companyCode: stuCode);
              if (status == 200) {
                loadingSuccess(status: "Done");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage(role: 2)));
              } else
                loadingFail(status: "Delete Failed !!!");
            } catch (e) {
              loadingFail(status: "Something Wrong !!!");
            }
          },
          child: Text(
            "Delete",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
