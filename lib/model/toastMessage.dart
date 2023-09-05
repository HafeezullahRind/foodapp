import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toast {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
