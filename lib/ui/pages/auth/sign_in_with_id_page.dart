// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:voice_chat/repositorys/auth_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/ui/widgets/privacy_policy_text_widget.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SignInWithIDPage extends StatefulWidget {
  const SignInWithIDPage({super.key});

  @override
  State<SignInWithIDPage> createState() => _SignInWithIDPageState();
}

class _SignInWithIDPageState extends State<SignInWithIDPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // App Bar
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        title: Text("SignIn", style: TextStyle(color: AppColor.black)),
      ),
      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: h30),
            //Logo Image
            const AppLogoWidget(),
            SizedBox(height: h30),
            Text(
              "SignIn with ID",
              style: textTheme.headlineMedium!.copyWith(color: AppColor.black),
            ),
            SizedBox(height: h10),
            Text(
              "Plaase enter your ID in the Chat entity",
              style: textTheme.headlineSmall!.copyWith(color: AppColor.black54),
            ),
            SizedBox(height: h60),
            //input form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  // Phone number
                  KTextField2(
                    textEditingController: phoneNumberController,
                    hintText: "Enter your ID number",
                    prefixIcon: const Icon(Icons.phone_android),
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: h10),
                  // Password
                  KTextField2(
                    textEditingController: passwordController,
                    hintText: "Enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: h10),
                  //Login Btn
                  MyGradientBtn(
                    onPress: () => loginBtn(),
                    text: "Sign In".toUpperCase(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: SizedBox(
            width: 200,
            // child: Text.rich(
            //   style: GoogleFonts.roboto(
            //     color: AppColor.black,
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   textAlign: TextAlign.center,
            //   TextSpan(
            //     text: "You agree to the",
            //     children: [
            //       TextSpan(
            //         text: " terms of use ",
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             AppUtils.showSnakBar("Terms of use");
            //           },
            //         style: TextStyle(color: AppColor.closeToBlue),
            //       ),
            //       const TextSpan(text: "and"),
            //       TextSpan(
            //         text: " privacy policy",
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             AppUtils.showSnakBar("Privacy policy");
            //           },
            //         style: TextStyle(color: AppColor.closeToBlue),
            //       ),
            //     ],
            //   ),
            // ),
            child: PrivacyPolicyTextWidget(textColor: AppColor.black),
          ),
        ),
      ),
    );
  }

// Login
  loginBtn() {
    // print(phoneNumberController.text);

    if (phoneNumberController.text.isEmpty || passwordController.text.isEmpty) {
      AppUtils.showSnakBar(msg: "Field is Empty", second: 2);
    } else {
      print("data");
      AuthRepository.instance.signInWithId(
          phone: phoneNumberController.text, password: passwordController.text);
      // Get.offAll(() => const BottomNavBarPage());
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
