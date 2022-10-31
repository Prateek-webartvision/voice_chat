import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_with_id_page.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_with_number_page.dart';
import 'package:voice_chat/ui/widgets/app_logo_widget.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/utils/app_utils.dart';

import '../../widgets/backgraund_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AuthBackgraundWidget(
        widget: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: h60),
                const AppLogoWidget(),
                SizedBox(height: h30),
                Text(
                  "Voice Chat",
                  style: textTheme.headlineMedium,
                ),
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
                        mode: SocialLoginButtonMode.multi,
                        onPressed: () {},
                      ),
                      SizedBox(height: h10),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        borderRadius: 16.r,
                        width: 300.w,
                        mode: SocialLoginButtonMode.multi,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // login with id
                    MyRoundedIConBtn(
                      icon: Icon(
                        Icons.person,
                        size: 30,
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
                        size: 30,
                        color: AppColor.white,
                      ),
                      bgColor: AppColor.closeToBlue,
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
                  child: Text.rich(
                    style: TextStyle(
                      color: AppColor.white,
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
                          style: TextStyle(color: AppColor.closeToBlue),
                        ),
                        const TextSpan(text: "and"),
                        TextSpan(
                          text: " privacy policy",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppUtils.showSnakBar("Privacy policy");
                            },
                          style: TextStyle(color: AppColor.closeToBlue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
