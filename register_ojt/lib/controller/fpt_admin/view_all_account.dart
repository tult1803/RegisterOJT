import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';
import 'package:register_ojt/model/get/get_all_account.dart';
import 'package:register_ojt/model/model_account_staff.dart';

class AllAccountData extends StatefulWidget {
  int? id;

  AllAccountData({this.id});

  @override
  _AllAccountDataState createState() => _AllAccountDataState();
}

class _AllAccountDataState extends State<AllAccountData> {
  List<CompanyAccount>? data;

  getData() async {
    CompanyAccounts accounts = CompanyAccounts();
    data = await accounts.getAccounts(companyID: widget.id);
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
                return _account(
                  companyCode: data![index].companyCode,
                  name: data![index].fullname,
                  email: data![index].email,
                  username: data![index].username,
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

  Widget _account({companyCode, name, email, username}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Code: " + "${companyCode ?? "---"}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Name: " + "${name ?? "---"}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Email: " + "${email ?? "---"}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Username: " + "${username ?? "---"}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
