import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voice_chat/controller_binding.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/models/profile_model.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:voice_chat/repositorys/socket_io_repo.dart';
import 'package:voice_chat/res/app_themes.dart';
import 'package:voice_chat/ui/pages/auth/sign_in_page.dart';
import 'package:voice_chat/ui/pages/bottom_navs/bottom_nav_bar_page.dart';

import 'utils/app_utils.dart';

networkChecker() {
  Connectivity().onConnectivityChanged.listen(
    (event) {
      if (event == ConnectivityResult.none) {
        AppUtils.showFlushBar(
          message: "No Internet Connection",
          color: Colors.red,
        );
        // isConnected = false;
      } else {
        AppUtils.closeFlushBar();
        // isConnected = true;
      }
      // update();
    },
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocketIoPrository.instance.initSocket();
  // SocketIoPrository.instance.connect();
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
              //check internet
              networkChecker();
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
