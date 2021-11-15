import 'package:flutter/material.dart';
import 'package:register_ojt/model/get/get_statistic_dropbutton_value.dart';

class ViewStatistic extends StatefulWidget {
  // const ViewStatistic({Key? key}) : super(key: key);

  @override
  _ViewStatisticState createState() => _ViewStatisticState();
}

class _ViewStatisticState extends State<ViewStatistic> {
  var listSemester;
  var dropDownVal=[""];
  String? dropDownValue;

  Widget _dropDownButton() {
    return Material(
      child: DropdownButton<String>(
        value: dropDownValue,
        items: dropDownVal.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          print(value);
          dropDownValue = value;
          print(dropDownValue);
          switch (value) {
            case "Fall 2021":
              break;
            default:
              break;

          }
          setState(() {
          });
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(dropDownValue);
    getData();
  }

  getData() async {
    GetStatisticDropButtonVal getSemesterVal = GetStatisticDropButtonVal();
    listSemester = await getSemesterVal.getListStatisticStatusVal();
    for(int i=0;i < listSemester.length; i++){
      dropDownVal.add(listSemester[i].name);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Statistic',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent,
            border: Border.all(width: 0.5, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 0.5,
                color: Colors.transparent.withOpacity(0.1),
                //offset: Offset(0, 10)
              )
            ]),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
            width: size.width * 1.5,
            height: size.height * 2.0,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    children: [_dropDownButton()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}