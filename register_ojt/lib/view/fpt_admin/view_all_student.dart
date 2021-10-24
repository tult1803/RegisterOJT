import 'package:flutter/material.dart';
import 'package:register_ojt/controller/fpt_admin/list_student_for_staff.dart';
import 'package:register_ojt/utils/helpers.dart';
import 'package:register_ojt/view/fpt_admin/ojt_student_details.dart';

class AllStudent extends StatefulWidget {
  const AllStudent({Key? key}) : super(key: key);

  @override
  _AllStudentState createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {
  // String? token;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }
  //
  // getData() async {
  //   token = await getDataSession(key: "token");
  //   setState(() {});
  // }

  // Widget _student() {
  //   return Container(
  //     padding: EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(15),
  //         border: Border.all(width: 1, color: Colors.grey)),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "SE130633 - Đoàn Quang Huy",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             // Icon(
  //             //   Icons.where_to_vote_rounded,
  //             //   color: Colors.green,
  //             //   size: 15,
  //             // ),
  //             Text('Acceptance', style: TextStyle(
  //                 fontSize: 11.5, fontWeight: FontWeight.bold, color: Colors.green
  //             ),)
  //           ],
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "GPA: 7.2",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 RichText(
  //                   text: TextSpan(
  //                     style: DefaultTextStyle.of(context).style,
  //                     children: const <TextSpan>[
  //                       TextSpan(
  //                           text: 'Company request: ',
  //                           style: TextStyle(fontWeight: FontWeight.bold)),
  //                       TextSpan(
  //                           text: "FPT Software",
  //                           style: TextStyle(
  //                             //color: Colors.green,
  //                               fontWeight: FontWeight.bold)),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.push(context, MaterialPageRoute(builder: (context) => OjtStudentDetails()));
  //               },
  //               child: Text(
  //                 "Detail",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.black),
  //               ),
  //               style: ButtonStyle(
  //                 padding: MaterialStateProperty.all(EdgeInsets.only(
  //                     left: 25, right: 25, top: 15, bottom: 15)),
  //                 backgroundColor:
  //                 MaterialStateProperty.all<Color>(Colors.lightBlue.shade300),
  //                 //MaterialStateProperty.all<Color>(Colors.orange.shade600)
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.fromLTRB(40, 15, 40, 10),
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
          ]
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 15, 30, 50),
            width: size.width * 0.8,
            height: size.height * 1.4,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
              child: SingleChildScrollView(
                child: ListStudentForStaffData()
              )
          ),
        ),
    );
  }

}
