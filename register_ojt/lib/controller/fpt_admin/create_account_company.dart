import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/controller/send_email.dart';
import 'package:register_ojt/model/post/post_create_account.dart';
import 'package:register_ojt/view/home_page.dart';

class CreateAccountData extends StatefulWidget {
  int? id;
  String? companyName;
  CreateAccountData({this.id, this.companyName});

  @override
  _CreateAccountDataState createState() => _CreateAccountDataState();
}

class _CreateAccountDataState extends State<CreateAccountData> {
  String? code, username, password, fullname, email;
  String? data;
  int? position;

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
      case 1:
        code = data;
        break;
      case 2:
        username = data;
        break;
      case 3:
        password = data;
        break;
      case 4:
        fullname = data;
        break;
      case 5:
        email = data;
        break;
    }
  }

  createAccount() async {
    try {
      loadingLoad(status: "Processing...");
      PostCreateAccount createAccount = PostCreateAccount();
      int status = await createAccount.createAccount(
          companyID: widget.id,
          code: code,
          username: username,
          password: password,
          name: fullname,
          email: email);
      if (status == 200) {
        String subject = "Thông tin đăng nhập hệ thống FPT University";
        int statusSendEmail = await sendEmailCreateAccount(
            email: "$email",
            nameCompany: "${widget.companyName}",
            subject: subject,
            username: "$username",
            password: "$password");
        if(statusSendEmail == 200){
          loadingSuccess(status: "Create Success !!!");
          return true;
        }
        setState(() {});
      } else
        loadingFail(status: "Create Account Failed !!!");
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
            "New Account",
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
                height: 30,
              ),
              txtAccountInfo(size,
                  title: "Username: ",
                  hintText: "Input account's username",
                  pos: 1),
              txtAccountInfo(size,
                  title: "Password: ",
                  hintText: "Input account's password",
                  pos: 2),
              txtAccountInfo(size,
                  title: "Company staff's Code: ",
                  hintText: "Input code of company's staff",
                  pos: 3),
              txtAccountInfo(size,
                  title: "Company staff's Full name: ",
                  hintText: "Input name of company's staff",
                  pos: 4),
              txtAccountInfo(size,
                  title: "Company staff's Email: ",
                  hintText: "Input email of company's staff",
                  pos: 5),
              SizedBox(
                height: 30,
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

  Widget txtAccountInfo(size, {String? title, String? hintText, int? pos}) {
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget btnSave() {
    return ElevatedButton(
      onPressed: () async {
        if (code != null &&
            username != null &&
            password != null &&
            fullname != null &&
            email != null) {
          bool checkCreate = await createAccount();
          if (checkCreate) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(role: 1)));
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
