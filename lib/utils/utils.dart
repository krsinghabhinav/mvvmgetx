import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocuseChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  messToast(String message, Color backgrund) {
    Fluttertoast.showToast(msg: message, backgroundColor: backgrund);
  }

  static snackBar(String title, String mess, Color background) {
    Get.snackbar(title, mess, backgroundColor: background);
  }
}
