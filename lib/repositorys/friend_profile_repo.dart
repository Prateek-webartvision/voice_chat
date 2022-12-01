import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friends_models/friend_profile_model.dart';

class FirendProfileRepository {
  getUserById(int id) {
    FriendProfileController.instance.setStatus(apiStatusEnum: ApiStatusEnum.loading);

    ApiServices.postApi(url: AppUrls.getUserProfileById, mapData: {
      "token": UserController.instance.getToken,
      "any_user_id": id,
    }).then((value) {
      if (value['status'] == true) {
        FriendProfileController.instance.setStatus(
          apiStatusEnum: ApiStatusEnum.success,
          friendProfileData: FriendProfileModel.fromJson(value['data']),
        );
      } else {
        FriendProfileController.instance.setStatus(apiStatusEnum: ApiStatusEnum.error, errors: value['msg']);
      }
      print(value['msg']);
    }).onError((error, stackTrace) {
      FriendProfileController.instance.setStatus(apiStatusEnum: ApiStatusEnum.error, errors: error.toString());
      print(error);
    });
  }
}
