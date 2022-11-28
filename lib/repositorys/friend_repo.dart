import 'package:voice_chat/controllers/friend_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friends_models/friend_model.dart';
import 'package:voice_chat/models/friends_models/friends_and_followers_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class FriendRepository {
  static FriendRepository instance = FriendRepository();

  //send friend request
  sendFriendRequest({required int friendId}) {
    Map<String, dynamic> requestData = {
      "token": UserController.instance.getToken,
      "friend_id": friendId,
    };

    print(requestData);

    AppUtils.progressDailog();
    ApiServices.postApi(url: AppUrls.sendFriendRequest, mapData: requestData).then((response) {
      if (response['status']) {
        AppUtils.closeDailog();
        AppUtils.showSnakBar(msg: response["msg"], second: 2);
      } else {
        AppUtils.closeDailog();
        AppUtils.showSnakBar(msg: response["msg"], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  //get all friend requests
  getFriendRequest() {
    FriendsController.instance.firendsmodelList = null;
    ApiServices.postApi(url: AppUrls.getFriendsRquestList, mapData: {"token": UserController.instance.getToken}).then((value) {
      // print(value);
      FriendsController.instance.friendRequestFun(FirendModel.fromJson(value));
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  //respond Friend Request
  Future respondFriendRequest({required int requestedById, required bool accept}) async {
    Map<String, dynamic> respondData = {"token": UserController.instance.getToken, "requested_by": requestedById, "accept": accept};
    AppUtils.progressDailog();
    var data = await ApiServices.postApi(url: AppUrls.respondFriendRequest, mapData: respondData).then((value) {
      AppUtils.closeDailog();
      if (value['status'] == true) {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
      return value;
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
      return null;
    });

    return data;
  }

//Get Friends and followers
  getFriendsAndFollowers() {
    Map<String, dynamic> myFriendsData = {"token": UserController.instance.getToken};
    ApiServices.postApi(url: AppUrls.getFriendsAndFolloersList, mapData: myFriendsData).then((value) {
      // print(value);
      if (value['status'] == true) {
        FriendsController.instance.addFriendsAndFollowerData(FriendsAndFollowersModel.fromJson(value['data']));
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }
}
