import 'package:flutter/material.dart';
import 'package:register_ojt/components/component.dart';

class EditEvaluation extends StatefulWidget {
  const EditEvaluation({Key? key}) : super(key: key);

  @override
  _EditEvaluationState createState() => _EditEvaluationState();
}

class _EditEvaluationState extends State<EditEvaluation> {
  Widget _editDetails(String label) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Container(
            width: 450,
            child: TextField(
              style: TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _labelInfo() {
  //   return Container(
  //       width: 200,
  //       padding: EdgeInsets.all(15),
  //       margin: EdgeInsets.only(left: 30),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "Name: ",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //           ),
  //           SizedBox(
  //             height: 65,
  //           ),
  //           Text(
  //             "Position: ",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //           ),
  //           SizedBox(
  //             height: 65,
  //           ),
  //           Text(
  //             "Grade Evaluation: ",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //           ),
  //           SizedBox(
  //             height: 65,
  //           ),
  //           Text(
  //             "Description: ",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //           ),
  //           SizedBox(
  //             height: 65,
  //           ),
  //           Text(
  //             "Start Date: ",
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
  //           ),
  //         ],
  //       ));
  // }

  // Widget dataInputInfo() {
  //   return Container(
  //       width: 450,
  //       padding: EdgeInsets.all(10),
  //       margin: EdgeInsets.only(right: 50),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           TextField(
  //             style: TextStyle(fontSize: 18),
  //             decoration: const InputDecoration(
  //               border: UnderlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           TextField(
  //             style: TextStyle(fontSize: 18),
  //             decoration: const InputDecoration(
  //               border: UnderlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           TextField(
  //             style: TextStyle(fontSize: 18),
  //             decoration: const InputDecoration(
  //               border: UnderlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           TextField(
  //             style: TextStyle(fontSize: 18),
  //             decoration: const InputDecoration(
  //               border: UnderlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           TextField(
  //             style: TextStyle(fontSize: 18),
  //             decoration: const InputDecoration(
  //               border: UnderlineInputBorder(),
  //             ),
  //           ),
  //         ],
  //       ));
  // }

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
        child: Center(
            child: Container(
      margin: EdgeInsets.only(top: 15),
      width: size.width * 0.5,
      height: size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.orange[200],
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
        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          leading: leadingAppbar(context, colorIcon: Colors.black87),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Edit Evaluation",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _editDetails("Name: "),
                  _editDetails("Position: "),
                  _editDetails("Grade Evaluation: "),
                  _editDetails("Description: "),
                  _editDetails("Start Date: ")
                ],
              ),
              SizedBox(
                height: 40,
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
              )
            ],
          ),
        ),
      ),
    )));
  }
}
