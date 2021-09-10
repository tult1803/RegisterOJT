
import 'package:flutter/material.dart';
import 'package:register_ojt/utils/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String currentNamePage = "OJT Information";

class _HomePageState extends State<HomePage> {
  var token;
  _getToken() async {
    token = await getDataSession(key: "token");
    setState(() {
      token = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          topBar(context),
        ],
      ),
    );
  }

  Widget miniContainer(String title, {required bool isHiddenColor}) {

    return Container(
      decoration: BoxDecoration(
          color: isHiddenColor == true ? Colors.orangeAccent : Colors.white54,
          borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: 150,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onPressed: () {
          setState(() {
            currentNamePage = title;
          });
        },
        child: Center(
            child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),
            )),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: size.width * 0.3,
            child: Text(
              "SE130223 - Lê Thanh Tú | $currentNamePage",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              child: Wrap(
                spacing: 10,
                children: [
                  miniContainer("OJT Information", isHiddenColor: false),
                  miniContainer("Send Application", isHiddenColor: false),
                  miniContainer("View Application", isHiddenColor: false),
                  miniContainer("Logout", isHiddenColor: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
