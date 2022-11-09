import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/ui/pages/bottom_navs/bottom_nav_bar_page.dart';
import 'package:voice_chat/utils/app_utils.dart';

class AuthRepository {
  ApiServices apiServices = ApiServices();
  UserController userController = UserController.instance;

  signInWithId({required String phone, required String password}) {
    AppUtils.progressDailog();
    Map<String, dynamic> userData = (kDebugMode == true)
        ? {
            "mobile": "1234567890",
            "password": "123",
          }
        : {
            "mobile": phone,
            "password": password,
          };

    ApiServices.postApi(url: AppUrls.signInWithId, mapData: userData).then(
      (value) {
        var userRes = value['data'];
        userController.setUser(
          userData: {
            userController.id: userRes[userController.id],
            userController.firstName: userRes[userController.firstName],
            userController.lastName: userRes[userController.lastName],
            userController.mobile: userRes[userController.mobile],
            userController.token: userRes[userController.token],
          },
        ).then((v) {
          // send to home page
          Get.offAll(() => const BottomNavBarPage());
        });
        AppUtils.closeDailog();
      },
    ).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }
}
