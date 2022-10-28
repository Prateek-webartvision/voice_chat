import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/bottom_navs/bottom_nav_bar_page.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/utils/app_utils.dart';

class SignInWithIDPage extends StatelessWidget {
  const SignInWithIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextEditingController idController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.black),
        backgroundColor: AppColor.white,
        centerTitle: true,
        elevation: 0,
        title: Text("SignIn", style: TextStyle(color: AppColor.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: h30),
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
                  KTextField(
                    controller: idController,
                    hintText: "Enter your ID number",
                    prefixIcon: const Icon(Icons.phone_android),
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: h10),
                  // Password
                  KTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    prefixIcon: const Icon(Icons.lock),
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: h10),
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
            child: Text.rich(
              style: GoogleFonts.roboto(
                color: AppColor.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              TextSpan(
                text: "You agree to the",
                children: [
                  TextSpan(
                    text: " terms of use ",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppUtils.showSnakBar("Terms of use");
                      },
                    style: TextStyle(color: AppColor.closeToRed),
                  ),
                  const TextSpan(text: "and"),
                  TextSpan(
                    text: " privacy policy",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppUtils.showSnakBar("Privacy policy");
                      },
                    style: TextStyle(color: AppColor.closeToRed),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginBtn() {
    Get.offAll(() => const BottomNavBarPage());
  }
}
