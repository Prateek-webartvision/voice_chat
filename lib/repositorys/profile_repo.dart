import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/profile_model.dart';
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
    return ProfileController.instance.profileData;
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
    // if (image != null) {
    //   print(base64Encode(File(image).readAsBytesSync()));
    // }
    Map<String, dynamic> userData = {
      "first_name": firstName,
      "last_name": lastName,
      "image":
          (image != null) ? base64.encode(File(image).readAsBytesSync()) : null,
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

  //post with multipart
  static Future postApiWithMultiPartProfile({
    String? image,
  }) async {
    var res;
    try {
      var req = MultipartRequest("POST", Uri.parse(AppUrls.profileUpdate));
      req.fields["token"] = UserController.instance.getToken;
      req.files.add(await MultipartFile.fromPath("image", image!));
      res = await req.send();
      print(req);
    } catch (e) {
      print("object");
    }
    return "data";
  }
}
