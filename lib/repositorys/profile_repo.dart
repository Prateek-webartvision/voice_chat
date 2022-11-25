import 'dart:io';

import 'package:http/http.dart' as http;
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
    String? firstName,
    String? lastName,
    String? dob,
    String? gender,
    String? country,
  }) {
    AppUtils.progressDailog();
    Map<String, dynamic> userData = {
      "first_name": firstName,
      "last_name": lastName,
      "dob": dob,
      "gender": gender,
      "country": country,
      "token": UserController.instance.getToken,
    };
    ApiServices.postApi(url: AppUrls.profileUpdate, mapData: userData)
        .then((value) {
      AppUtils.closeDailog();

      getProfile();
    });
  }

  //post with multipart
  Future postApiWithMultiPartProfile({
    required File image,
  }) async {
    AppUtils.progressDailog();
    var request =
        http.MultipartRequest('POST', Uri.parse(AppUrls.profileUpdateNew));
    request.fields.addAll({
      "token": UserController.instance.getToken,
    });
    request.files
        .add(await http.MultipartFile.fromPath('profile_image', image.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      AppUtils.closeDailog();
      getProfile();
      // print(await response.stream.bytesToString());
    } else {
      AppUtils.closeDailog();
      print(response.reasonPhrase);
    }
  }
}
