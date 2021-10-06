import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_ojt/utils/helpers.dart';

class ViewApplication extends StatefulWidget {
  const ViewApplication({Key? key}) : super(key: key);

  @override
  _ViewApplicationState createState() => _ViewApplicationState();
}

class _ViewApplicationState extends State<ViewApplication> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    token = await getDataSession(key: "token");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: size.height * 0.76,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          containerInfo(
              id: "SE130223",
              name: "Lê Thanh Tú",
              applyDate: "30/01/2021 21:05",
              applyTo: "Công ty thương mại điện tử Megazon",
              status: 0),
          containerInfo(
              id: "SE130223",
              name: "Lê Thanh Tú",
              applyDate: "30/01/2021 21:05",
              applyTo: "Công ty thương mại điện tử Megazon",
              status: 1),
          containerInfo(
              id: "SE130223",
              name: "Lê Thanh Tú",
              applyDate: "30/01/2021 21:05",
              applyTo: "Công ty thương mại điện tử Megazon",
              status: 2),
        ],
      ),
    );
  }

  Widget containerInfo({id, name, applyDate, applyTo, status}) {
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
                        "${getStatusType(status)}",
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
