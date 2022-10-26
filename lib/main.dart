// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_themes.dart';
import 'package:voice_chat/ui/auth/sign_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.7, 834.9),
      builder: (context, child) {
        return GetMaterialApp(
          title: "Voice Chat",
          theme: AppThemes.light(),
          darkTheme: AppThemes.dark(),
          themeMode: ThemeMode.light,
          home: SignInPage(),
        );
      },
    );
  }
}
