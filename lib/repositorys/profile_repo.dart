import 'dart:convert';
import 'dart:io';

import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/utils/app_utils.dart';

class ProfileRepository {
  static ProfileRepository instance = ProfileRepository();

  getProfile() async {
    ProfileController.instance.error = null;
    ProfileController.instance.profileData = null;

    await ApiServices.postApi(
      url: AppUrls.getCurrentUserBytoken,
      mapData: {"token": UserController.instance.getToken},
    ).then(
      (value) {
        if (value['status'] == false) {
          //erroe
          ProfileController.instance.setError(value['msg']);
          UserController.instance.logoutUser();
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

  updateProfile({
    String? image,
    String? firstName,
    String? lastName,
    String? dob,
    String? gender,
    String? country,
  }) {
    AppUtils.progressDailog();
    File? img;
    List<int>? imgbty;
    if (image != null) {
      img = File(image);
      imgbty = img.readAsBytesSync();
    }

    Map<String, dynamic> userData = {
      "first_name": firstName,
      "last_name": lastName,
      // "image": (image != null)
      //     ? "data:image/png;base64,${base64Encode(imgbty!)}"
      //     : null,
      "dob": dob,
      "gender": gender,
      "country": country,
      "token": UserController.instance.getToken,
    };
    // print("data:image/png;base64," + base64Encode(imgbty));

    ApiServices.postApi(url: AppUrls.profileUpdate, mapData: userData)
        .then((value) {
      AppUtils.closeDailog();
      print(value);
      getProfile();
    });

    print(" $image $firstName $lastName $dob, $gender $country");
  }
}
