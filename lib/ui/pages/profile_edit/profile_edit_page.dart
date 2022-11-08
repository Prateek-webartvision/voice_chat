import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

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
          "Edit Profile",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}
