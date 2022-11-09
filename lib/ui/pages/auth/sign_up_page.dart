// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/repositorys/auth_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.grey200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.grey200,
        centerTitle: true,
        elevation: 0,
        title: Text("SignUn", style: TextStyle(color: AppColor.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(height: 20),
              AppLogoWidget(),
              SizedBox(height: h30),
              Text(
                "Test Sign up page",
                style:
                    textTheme.headlineMedium!.copyWith(color: AppColor.black),
              ),
              SizedBox(height: h50),
              //Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: (Get.width - 26) / 2,
                      child: KTextField2(
                        textEditingController: _firstName,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        fillColor: AppColor.white,
                        hintText: "First Name",
                      )),
                  SizedBox(
                      width: (Get.width - 26) / 2,
                      child: KTextField2(
                        textEditingController: _lastName,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        fillColor: AppColor.white,
                        hintText: "Last Name",
                      )),
                ],
              ),
              //Phone
              SizedBox(height: h10),
              KTextField2(
                textEditingController: _phone,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                hintText: "Phone Number",
                fillColor: AppColor.white,
              ),
              // password
              SizedBox(height: h10),
              KTextField2(
                textEditingController: _password,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                isPassword: true,
                hintText: "Password",
                fillColor: AppColor.white,
              ),
              SizedBox(height: h60),
              MyGradientBtn(
                onPress: signUpFun,
                text: "Sign Up".toUpperCase(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUpFun() {
    if (_firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _phone.text.isEmpty ||
        _password.text.isEmpty) {
      AppUtils.showSnakBar(msg: "Field is empty", second: 2);
    } else {
      AuthRepository.instance
          .signUpWithPhoneAndPassword(
        phoneNumber: _phone.text,
        firstName: _firstName.text,
        lastName: _lastName.text,
        password: _password.text,
      )
          .then((v) {
        if (v == true) {
          _firstName.clear();
          _lastName.clear();
          _password.clear();
          _phone.clear();
        }
      });
    }
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }
}
