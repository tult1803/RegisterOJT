
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

getDataSession({required String key}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return  prefs.get(key);
}

setDataSession({required String key, required String value}) async{
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

