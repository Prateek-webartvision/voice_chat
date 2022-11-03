import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_themes.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PrivacyPolicyTextWidget extends StatelessWidget {
  const PrivacyPolicyTextWidget({
    Key? key,
    this.textColor,
  }) : super(key: key);

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: KTextTheme.btmText.copyWith(color: textColor),
      textAlign: TextAlign.center,
      TextSpan(
        text: "You agree to the",
        children: [
          TextSpan(
            text: " terms of use ".capitalize,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO Add Terms of Use here
                AppUtils.showSnakBar("Terms of use");
              },
            style: KTextTheme.btmTextSpan,
          ),
          const TextSpan(text: "and"),
          TextSpan(
            text: " privacy policy".capitalize,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO add privacy Policy here
                AppUtils.showSnakBar("Privacy policy");
              },
            style: KTextTheme.btmTextSpan,
          ),
        ],
      ),
    );
  }
}
