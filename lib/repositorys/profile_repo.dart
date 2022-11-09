import 'dart:math';

import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';

class ProfileRepository {
  static ProfileRepository instance = ProfileRepository();

  getProfile() async {
    await ApiServices.postApi(
        url: AppUrls.getCurrentUserBytoken,
        mapData: {"token": UserController.instance.getToken}).then(
      (value) {
        if (value['status'] == false) {
          //erroe
          ProfileController.instance.setError(value['msg']);
        } else {
          //success
          ProfileController.instance
              .setProfileData(ProfileModel.fromJson(value['data']));
        }
      },
    ).onError(
      (error, stackTrace) {
        ProfileController.instance.setError(error.toString());
      },
    );
  }
}
