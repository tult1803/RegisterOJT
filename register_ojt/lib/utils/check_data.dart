import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

validateStudentId(studentId){
  if(studentId == null || studentId!.isEmpty){
    return "Student Id is empty";
  }else if(studentId!.length < 7){
    return "Length of Id must be bigger or equal 7";
  } else return null;
}

validateFullName(fullName){
  if(fullName == null || fullName!.isEmpty){
    return "Full Name is empty";
  }else if(fullName!.length < 4){
    return "Length of name must be bigger than 3";
  } else return null;
}

validateCV(BuildContext context, cv){
  if(cv == null){
    EasyLoading.showError("CV is empty", duration: Duration(seconds: 2));
    return false;
   }else return true;
}