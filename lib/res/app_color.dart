import 'package:flutter/material.dart';

class AppColor extends Color {
  //convert hax color to int color
  AppColor.hexColor({required String colorCode})
      : super(int.parse("0xff${colorCode.split("#").last}"));

  static Color transparent = Colors.transparent;

  static Color white = Colors.white;
  static Color white54 = Colors.white54;

  static Color grey400 = Colors.grey.shade400;
  static Color grey200 = Colors.grey.shade200;

  static Color black = Colors.black;
  static Color black54 = Colors.black54;

  // static Color closeToRed = const Color(0xffEF308C);
  // static Color closeToYellow = const Color(0xfffcc284);

  static const Color closeToBlue = Color(0xff50B3E5);
  static const Color closeToPurple = Color(0xff8F4398);

  // Gradient
  static backgraundGradient() => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        // stops: [0, 0.7],
        tileMode: TileMode.clamp,
        colors: [
          closeToBlue,
          closeToPurple,
        ],
      );

  static const Gradient backgraundGradientV = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.clamp,
    colors: [
      closeToBlue,
      closeToPurple,
    ],
  );
}
