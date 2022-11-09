// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_page.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey200,
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Link account
              ListTile(
                onTap: () {
                  print("Link Account");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Link Account",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              //Update virsion
              ListTile(
                onTap: () {
                  print("Update virsion");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Update virsion",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("1.2.4"),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),

              SizedBox(height: 20),
              //Change language
              ListTile(
                onTap: () {
                  print("Change Language");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Change Language",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              //Black List
              ListTile(
                onTap: () {
                  print("Black List");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Black List",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              //Privacy agreement
              ListTile(
                onTap: () {
                  print("Privacy agreement");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Privacy agreement",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              //About voice chat
              ListTile(
                onTap: () {
                  print("About voice chat");
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "About voice chat",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
              //Logout
              ListTile(
                onTap: () {
                  // LogOut methods
                  UserController.instance.logoutUser().then(
                    (value) async {
                      AppUtils.progressDailog();
                      await Future.delayed(
                        Duration(seconds: 1),
                        () {
                          AppUtils.closeDailog();
                          Get.offAll(() => SignInPage());
                        },
                      );
                    },
                  );
                },
                tileColor: AppColor.white,
                style: ListTileStyle.drawer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.black,
                        fontSize: 16.sp,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
