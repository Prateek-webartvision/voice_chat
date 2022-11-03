import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_chat/res/app_color.dart';

class AppThemes {
  // Light Theme
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          TextTheme(
            headlineMedium: KTextTheme.headlineMedium(AppColor.white),
            headlineSmall: KTextTheme.headlineSmall(AppColor.white54),
          ),
        ),
      );

// Dark Theme
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      );
}

class KTextTheme {
  static TextStyle headlineSmall(Color? textColor) {
    return TextStyle(
      color: textColor ?? AppColor.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle headlineMedium(Color? textColor) {
    return TextStyle(
      color: textColor ?? AppColor.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle btmText = TextStyle(
    color: AppColor.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle btmTextSpan = TextStyle(
    color: AppColor.closeToPurple,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
}
