import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/ui/pages/bottom_navs/bottom_nav_bar_page.dart';
import 'package:voice_chat/utils/app_utils.dart';

class AuthRepository {
  static AuthRepository instance = AuthRepository();
  final UserController userController = UserController.instance;

  //*Sign in with Id and password
  signInWithId({
    required String phone,
    required String password,
  }) {
    AppUtils.progressDailog();

    ApiServices.postApi(url: AppUrls.signInWithId, mapData: {"mobile": phone, "password": password}).then(
      (value) {
        AppUtils.closeDailog();
        // print(value);
        if (value["status"] == false) {
          AppUtils.showSnakBar(msg: value['msg'], second: 2);
        } else {
          //*seccess
          userController.setUser(
            userData: {
              userController.token: value['data'][userController.token],
            },
          ).then((v) {
            //* send to home page
            Get.offAll(() => const BottomNavBarPage());
          });
        }
      },
    ).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  //*Sign up wth phone and password
  signUpWithPhoneAndPassword({required String phoneNumber, required String firstName, required String lastName, required String password}) async {
    AppUtils.progressDailog();
    late bool isAccountCreated;

    await ApiServices.postApi(url: AppUrls.signUpWithPhoneAndPassword, mapData: {"first_name": firstName, "last_name": lastName, "mobile": phoneNumber, "password": password}).then((value) {
      AppUtils.closeDailog();
      // print(value);
      if (value['status'] == false) {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
        isAccountCreated = false;
      } else {
        AppUtils.showSnakBar(msg: "${value['msg']} go to signin page", second: 2);
        isAccountCreated = true;
      }
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      isAccountCreated = false;
    });

    return isAccountCreated;
  }
}
