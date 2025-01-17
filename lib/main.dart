import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voice_chat/controller_binding.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/notification_services.dart';
import 'package:voice_chat/res/app_themes.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/bottom_nav_bar_page.dart';

import 'utils/app_utils.dart';

networkChecker() {
  //* check internet connection
  Connectivity().onConnectivityChanged.listen(
    (event) {
      if (event == ConnectivityResult.none) {
        AppUtils.showFlushBar(
          message: "No Internet Connection",
          color: Colors.red,
        );
        //? isConnected = false;
      } else {
        AppUtils.closeFlushBar();
        //? isConnected = true;
      }
    },
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotifition.instance.setSettings();
  //! test notification will remove shortly
  LocalNotifition.instance.flutterNotiPlugin.show(1, "test notification", "You opened Voice chat", LocalNotifition.instance.notificationDetails);
  await GetStorage.init();
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
          home: GetBuilder<UserController>(
            builder: (user) {
              //? check internet
              //? networkChecker();
              if (user.getUser != null) {
                return const BottomNavBarPage();
              } else {
                return const SignInPage();
              }
            },
          ),
          initialBinding: ControllerBinding(),
        );
      },
    );
  }
}
