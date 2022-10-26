// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppColor extends Color {
  AppColor.color({required String colorCode}) : super(0xff0f4302);

  static Color transparent = Colors.transparent;
  static Color white = Colors.white;
  static Color white54 = Colors.white54;
  static Color grey400 = Colors.grey.shade400;
  static Color grey200 = Colors.grey.shade200;

  static Color black = Colors.black;
  static Color black54 = Colors.black54;

  static Color closeToRed = Color(0xffEF308C);
  static Color closeToYellow = Color(0xfffcc284);

  static backgraundGradient() => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0, 0.7],
        tileMode: TileMode.clamp,
        colors: [closeToRed, closeToYellow],
      );
}
