import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

class AuthBackgraundWidget extends StatelessWidget {
  const AuthBackgraundWidget({
    Key? key,
    this.widget,
  }) : super(key: key);

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(gradient: AppColor.backgraundGradient()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(o40p),
        ),
        child: widget,
      ),
    );
  }
}
