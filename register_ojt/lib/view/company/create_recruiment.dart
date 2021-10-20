import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';

class CreateRecruiment extends StatefulWidget {
  const CreateRecruiment({Key? key}) : super(key: key);

  @override
  _CreateRecruimentState createState() => _CreateRecruimentState();
}

class _CreateRecruimentState extends State<CreateRecruiment> {
  Widget txtFieldRecruiment(size, {String? title, bool? showBottom}) {
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
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget txtFieldJobDescription(size, {String? title}) {
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
          ),
        ],
      ),
    );
  }

  Widget btnSave() {
    return ElevatedButton(
      onPressed: () {},
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
      onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        headerCenter(context),
        Container(
          margin: EdgeInsets.only(top: 20),
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
                    txtFieldRecruiment(size, title: "Company: "),
                    txtFieldRecruiment(size, title: "Address: "),
                    txtFieldRecruiment(size, title: "Requirments for major: "),
                    txtFieldRecruiment(size, title: "Company's website: "),
                    txtFieldJobDescription(size, title: "Job Description: "),
                    txtFieldRecruiment(size, title: "Salary: "),
                    txtFieldRecruiment(size,
                        title: "EXPIRATION DATE: ", showBottom: true),
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
                      height: 10,
                    ),
                  ],
                ),
              )),
        ),
        footer(context,
            content:
                "Sinh viên cần hỗ trợ vui lòng liên hệ Trung tâm Dịch vụ Sinh viên tại Phòng 202, điện thoại : 028.73005585 , email: sschcm@fe.edu.vn"),
      ],
    ));
  }
}
