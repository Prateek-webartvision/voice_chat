import 'package:flutter/material.dart';
import 'package:voice_chat/res/constant_value.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: logoSize,
      width: logoSize,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Image.asset("assets/images/logo.jpeg"),
    );
  }
}
