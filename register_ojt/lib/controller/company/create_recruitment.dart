import 'package:flutter/material.dart';
import 'package:register_ojt/model/post/post_create_recruitment.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/view/home_page.dart';

class CreateRecruitmentData extends StatefulWidget {
  @override
  _CreateRecruitmentDataState createState() => _CreateRecruitmentDataState();
}

class _CreateRecruitmentDataState extends State<CreateRecruitmentData> {
  String? content, deadline, salary, majorName, area, topic;
  String? data, position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    setState(() {});
  }

  inputData() {
    switch (position) {
      case "txtTitle":
        topic = data;
        break;
      case "txtAddress":
        area = data;
        break;
      case "txtRequired":
        majorName = data;
        break;
      case "txtDescription":
        content = data;
        break;
      case "txtSalary":
        salary = data;
        break;
      case "txtDeadline":
        deadline = data;
        break;
      default:
        topic = data;
    }
  }

  create() async {
    try {
      PostCreateRecruitment createRecruitment = PostCreateRecruitment();
      int status = await createRecruitment.create(
          companyCode: stuCode,
          content: content,
          deadline: deadline,
          salary: salary,
          majorName: majorName,
          topic: topic,
          area: area);
      if (status == 200) {
        loadingSuccess(status: "Create Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Create Recruitment Failed !!!");
    } catch (e) {
      loadingFail(status: "$e");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: leadingAppbar(context, colorIcon: Colors.black87),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "New Recruitment",
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
              SizedBox(
                height: 10,
              ),
              txtFieldRecruiment(size,
                  title: "Title: ",
                  hintText: "Input Recruitment's Title",
                  pos: "txtTitle"),
              txtFieldRecruiment(size,
                  title: "Address: ",
                  hintText: "Input Working Address",
                  pos: "txtAddress"),
              txtFieldRecruiment(size,
                  title: "Requirments for major: ",
                  hintText: "Input Recruitment's requirments",
                  pos: "txtRequired"),
              txtFieldJobDescription(size,
                  title: "Job Description: ",
                  hintText: "More details about this recruitment",
                  pos: "txtDescription"),
              txtFieldRecruiment(size,
                  title: "Salary: ",
                  hintText: "Input Recruitment's Salary",
                  pos: "txtSalary"),
              txtFieldRecruiment(size,
                  title: "Expired Date: ",
                  showBottom: true,
                  hintText: "Input deadline",
                  pos: "txtDeadline"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnSave(),
                  SizedBox(
                    width: 200,
                  ),
                  btnCancel()
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget txtFieldRecruiment(size,
      {String? title, String? hintText, String? pos, bool? showBottom}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title ?? "-----"}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "${hintText ?? "-----"}",
              border: UnderlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                data = value;
                position = pos;
                inputData();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget txtFieldJobDescription(size,
      {String? title, String? hintText, String? pos}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${title ?? "-----"}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: "${hintText ?? "-----"}",
              border: UnderlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                data = value;
                position = pos;
                inputData();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget btnSave() {
    return ElevatedButton(
      onPressed: () async {
        if (content != null &&
            deadline != null &&
            salary != null &&
            majorName != null &&
            area != null &&
            topic != null) {
          bool checkCreate = await create();
          if (checkCreate) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(role: 2)));
          } else
            print("Failed");
        }
      },
      child: Text(
        "Save",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade600),
      ),
    );
  }

  Widget btnCancel() {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        "Cancel",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade600),
      ),
    );
  }
}
