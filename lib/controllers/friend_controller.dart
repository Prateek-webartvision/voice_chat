import 'package:get/get.dart';
import 'package:voice_chat/models/friends_models/friend_model.dart';
import 'package:voice_chat/models/friends_models/friends_and_followers_model.dart';

class FriendsController extends GetxController {
  static FriendsController instance = Get.find<FriendsController>();

  FirendModel? firendsmodelList;
  FriendsAndFollowersModel? friendsAndFollowersData;

  friendRequestFun(FirendModel firendData) {
    firendsmodelList = firendData;
    update();
  }

  addFriendsAndFollowerData(FriendsAndFollowersModel friendsAndFollowersModel) {
    friendsAndFollowersData = friendsAndFollowersModel;
    update();
  }
}
