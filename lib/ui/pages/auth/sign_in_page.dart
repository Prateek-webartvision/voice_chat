// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_with_id_page.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_with_number_page.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/ui/widgets/privacy_policy_text_widget.dart';

import '../../widgets/backgraund_widget.dart';

getUSer() async {
  await ApiServices.getApi(url: AppUrls.getAllUsers)
      .then((value) => print(value))
      .onError(
        (error, stackTrace) => print(error),
      );
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    getUSer();

    return Scaffold(
      body: AuthBackgraundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: h60),
                const AppLogoWidget(),
                SizedBox(height: h30),
                Text("Voice Chat", style: textTheme.headlineMedium),
                SizedBox(height: h10),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Your world and your place of enjoyment",
                    style: textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                //  socialBtn
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        borderRadius: 16.r,
                        width: 300.w,
                        height: h50,
                        mode: SocialLoginButtonMode.multi,
                        onPressed: () {
                          //TODO Add facebook
                        },
                      ),
                      SizedBox(height: h10),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        borderRadius: 16.r,
                        width: 300.w,
                        height: h50,
                        mode: SocialLoginButtonMode.multi,
                        onPressed: () {
                          //TODO add Google
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // login with id
                    MyRoundedIConBtn(
                      icon: Icon(
                        Icons.person,
                        size: h50 * .6,
                        color: AppColor.white,
                      ),
                      bgColor: AppColor.grey400,
                      onPress: () {
                        Get.to(() => const SignInWithIDPage());
                      },
                    ),
                    const SizedBox(width: 20),
                    // login with number
                    MyRoundedIConBtn(
                      icon: Icon(
                        Icons.call,
                        size: h50 * .6,
                        color: AppColor.white,
                      ),
                      bgColor: AppColor.closeToPurple,
                      onPress: () {
                        Get.to(() => const SignInWithNumberPage());
                      },
                    ),
                  ],
                ),

                SizedBox(height: h100),
                //Terms and privacy palicy
                SizedBox(
                  width: 200,
                  child: PrivacyPolicyTextWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
