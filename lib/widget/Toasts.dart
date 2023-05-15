

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
    String msg,
    double fontSize,
    {
      Toast toastLength = Toast.LENGTH_SHORT,
      Color color = Colors.white,
      Color backgroundColor = Colors.grey,
    }){
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: color,
    fontSize: fontSize,
  );
}