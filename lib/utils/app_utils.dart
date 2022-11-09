// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class AppUtils {
  static Flushbar flushbar = Flushbar();

  static showSnakBar({required String msg, int? second}) {
    Get.showSnackbar(
      GetSnackBar(
        duration: Duration(seconds: second ?? 1),
        messageText: Text(
          msg,
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }

  //Close Snack bar
  closeSnackbar() {
    Get.closeCurrentSnackbar();
  }

  //progressDailog
  static progressDailog() {
    Get.dialog(
      barrierDismissible: false,
      Center(
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(25)),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  //cloase dailog
  static closeDailog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  //flush bar
  static showFlushBar({
    required String message,
    required Color color,
  }) {
    flushbar = Flushbar(
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: color,
      ),
      margin: const EdgeInsets.all(16),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(12),
      leftBarIndicatorColor: color,
    )..show(Get.context!);
  }

  // close flush bor
  static closeFlushBar() {
    flushbar.dismiss();
  }
}
