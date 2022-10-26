import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';

class AppUtils {
  static showSnakBar(String msg) {
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 1),
      messageText: Text(
        msg,
        style: TextStyle(color: AppColor.white),
      ),
    ));
  }
}
