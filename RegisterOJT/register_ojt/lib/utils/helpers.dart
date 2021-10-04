import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getDataSession({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

setDataSession({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

colorHexa(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

getStatusType(int status) {
  switch (status) {
    case 0: return "Processing";
    case 1: return "Accepted";
    case 2: return "Reject";
    default: return "---";
  }
}

getStatusColor(int status) {
  Color color = Colors.black54;
  switch (status) {
    case 0: color = Colors.orangeAccent; break;
    case 1: color = Colors.green; break;
    case 2: color = Colors.redAccent; break;
  }
  return color;
}
