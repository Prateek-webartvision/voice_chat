import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class AppUtils {
  static Flushbar flushbar = Flushbar();

  static showSnakBar(String msg) {
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 1),
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
