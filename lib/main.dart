import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voice_chat/controller_binding.dart';
import 'package:voice_chat/res/app_themes.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_page.dart';
import 'package:voice_chat/utils/app_utils.dart';

void networkChecker() {
  Connectivity().onConnectivityChanged.listen(
    (event) {
      if (event == ConnectivityResult.none) {
        AppUtils.showFlushBar(
          message: "No Internet Connection",
          color: Colors.red,
        );
      } else {
        AppUtils.closeFlushBar();
      }
    },
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  networkChecker();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7, 834.9),
      builder: (context, child) {
        return GetMaterialApp(
          title: "Voice Chat",
          theme: AppThemes.light(),
          darkTheme: AppThemes.dark(),
          themeMode: ThemeMode.light,
          home: const SignInPage(),
          initialBinding: ControllerBinding(),
        );
      },
    );
  }
}
