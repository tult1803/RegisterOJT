import 'package:flutter/material.dart';
import 'package:register_ojt/model/get/get_all_company.dart';
import 'package:register_ojt/model/model_company_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/fpt_admin/view_all_account.dart';
import 'package:register_ojt/view/home_page.dart';

class AllCompanyData extends StatefulWidget {
  String? token;

  AllCompanyData({this.token});

  @override
  _AllCompanyDataState createState() => _AllCompanyDataState();
}

class _AllCompanyDataState extends State<AllCompanyData> {
  List<Company>? data;

  getData() async {
    Companies companies = Companies();
    data = await companies.getCompanies(staffCode: stuCode);
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
                return _company(
                  companyID: data![index].id,
                  name: data![index].companyName,
                  address: data![index].address,
                  webSite: data![index].webSite,
                  hostManagerEmail: data![index].hostManagerEmail,
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

  Widget btnDetail(int? companyID, String? companyName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllAccount(
                    id: companyID,
                    companyName: companyName,
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

  Widget _company({companyID, name, address, webSite, hostManagerEmail}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company's name: " + "${name ?? "---"}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Address: " + "${address ?? "---"}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Website: " + "${webSite ?? "---"}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Host Manager's email: " + "${hostManagerEmail ?? "---"}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                btnDetail(companyID, name),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
