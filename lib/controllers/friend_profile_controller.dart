import 'package:get/get.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/models/friends_models/friend_profile_model.dart';

class FriendProfileController extends GetxController {
  static FriendProfileController instance = Get.find<FriendProfileController>();

  ApiStatusEnum apiStatus = ApiStatusEnum.loading;
  String? error;
  FriendProfileModel? friendProfile;

  setStatus({required ApiStatusEnum apiStatusEnum, String? errors, FriendProfileModel? friendProfileData}) {
    apiStatus = apiStatusEnum;
    switch (apiStatusEnum) {
      case ApiStatusEnum.success:
        friendProfile = friendProfileData;
        error = null;
        break;
      case ApiStatusEnum.loading:
        friendProfile = null;
        error = null;
        break;
      case ApiStatusEnum.error:
        friendProfile = null;
        error = errors;
        break;
    }
    update();
  }

  //change is friend
  changeIsFriend(bool v) {
    friendProfile!.isFriend = v;
    update();
  }

  // change is following
  changeIsFollowing(bool v) {
    friendProfile!.isFollowing = v;
    update();
  }
}
