import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Widget headerCenter(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.center,
    width: size.width,
    height: 90,
    color: Colors.orangeAccent,
    child: Image.asset("images/fpt_logo.png"),
  );
}

Widget footer(BuildContext context, {String? content}) {
  var size = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 10),
    width: size.width,
    color: Colors.orangeAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text("${content ?? ""}", style: TextStyle(fontSize: 15),),
        Text("© Powered by FPT Student", style: TextStyle(fontSize: 15),),
        SizedBox(height: 10,),
      ],
    ),
  );
}

Widget containerProfile(size, {String? title, String? content,  bool? showBottom}) {
  return Container(
    height: 80,
    width: size.width,
    child: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: size.width * 0.2,
                  child: Text("$title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              Expanded(child: Container(child: Text("$content", style: TextStyle(color: Colors.black54, fontSize: 20),))),
            ],
          ),
        ),
        SizedBox(child: showBottom == null ? Container(margin: EdgeInsets.only(left: 20, right: 20),color: Colors.black45,height: 0.5,) : null),
      ],
    ),
  );
}

Widget containerRecruiment(size,
    {String? title, String? content, bool? showBottom}) {
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
        Text("${content ?? "-----"}",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        SizedBox(
            child: showBottom == null
                ? Container(
              margin: EdgeInsets.only(top: 12),
              color: Colors.black45,
              height: 0.5,
            )
                : null),
      ],
    ),
  );
}

Widget containerJobDescription(size,
    {String? title, String? content}) {
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
        Container(
          width: size.width * 0.4,
          height: 150,
          child: ListView(
            children: [
              Text("${content ?? "-----"}",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        SizedBox(
            child: Container(
              margin: EdgeInsets.only(top: 12),
              color: Colors.black45,
              height: 0.5,
            )),
      ],
    ),
  );
}

//Đổi màu và icon cho nút back screen
Widget leadingAppbar(BuildContext context, {Color? colorIcon}) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios_outlined,
        color: colorIcon == null ? Colors.white : colorIcon),
    onPressed: () => Navigator.of(context).pop(),
  );
}

void loadingLoad({required status}){
  EasyLoading.show(status: "$status", maskType: EasyLoadingMaskType.black,);
}

void loadingFail({required status}){
  EasyLoading.showError("$status",
  maskType: EasyLoadingMaskType.black,
  duration: Duration(seconds: 2));
}

void loadingSuccess({required status}){
  EasyLoading.showSuccess("$status",
      maskType: EasyLoadingMaskType.black,
      duration: Duration(seconds: 2));
}