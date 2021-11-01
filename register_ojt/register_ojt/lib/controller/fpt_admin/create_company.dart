import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/post/post_create_company.dart';
import 'package:register_ojt/view/fpt_admin/create_company.dart';
import 'package:register_ojt/view/home_page.dart';

class CreateCompanyData extends StatefulWidget {
  const CreateCompanyData({Key? key}) : super(key: key);

  @override
  _CreateCompanyDataState createState() => _CreateCompanyDataState();
}

class _CreateCompanyDataState extends State<CreateCompanyData> {
  String? companyName, address, webSite, hostManagerEmail;
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
        companyName = data;
        break;
      case 2:
        address = data;
        break;
      case 3:
        webSite = data;
        break;
    }
  }

  createCompany() async {
    try {
      PostCreateCompany createCompany = PostCreateCompany();
      int status = await createCompany.createCompany(
          name: companyName, address: address, webSite: webSite);
      if (status == 200) {
        loadingSuccess(status: "Create Success !!!");
        setState(() {});
        return true;
      } else
        loadingFail(status: "Create Company Failed !!!");
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
            "New Company",
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
              txtCompanyInfo(size,
                  title: "Company's name: ",
                  hintText: "Input company's name",
                  pos: 1),
              txtCompanyInfo(size,
                  title: "Address: ",
                  hintText: "Input company's address",
                  pos: 2),
              txtCompanyInfo(size,
                  title: "Website: ",
                  hintText: "Input company's website",
                  pos: 3),
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

  Widget txtCompanyInfo(size, {String? title, String? hintText, int? pos}) {
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
        if (companyName != null && address != null && webSite != null) {
          bool checkCreate = await createCompany();
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
