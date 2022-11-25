// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

class AppUtils {
  static Flushbar flushbar = Flushbar();
  static ImagePicker imagePicker = ImagePicker();

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
    if (Get.isSnackbarOpen != true) {
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
  }

  //Image picker dailog
  static imagePickerDailog({required Function(String image) seletedImage}) {
    Get.dialog(
      Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(36),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Material(
            color: AppColor.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Kundan",
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColor.black),
                ),
                SizedBox(height: h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await imagePicker
                            .pickImage(source: ImageSource.camera)
                            .then((value) {
                          if (value != null) {
                            seletedImage(value.path);
                          }
                          // print(value);
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColor.grey200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.camera_alt, size: 50),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await imagePicker
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          if (value != null) {
                            seletedImage(value.path);
                          }
                          // print(value);
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColor.grey200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.image, size: 50),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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
