import 'package:voice_chat/controllers/friend_request_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friend_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class FriendRepository {
  static FriendRepository instance = FriendRepository();

  //send friend request
  sendFriendRequest({required int friendId}) {
    Map<String, dynamic> requestData = {
      "token": UserController.instance.getToken,
      "friend_id": friendId,
    };
    ApiServices.postApi(url: AppUrls.sendFriendRequest, mapData: requestData)
        .then((response) {
      print(response);
      if (response['status']) {
        AppUtils.showSnakBar(msg: response["msg"], second: 2);
      } else {
        AppUtils.showSnakBar(msg: response["msg"], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  getFriendRequest() {
    FriendRequestController.instance.firendsmodelList = null;
    ApiServices.postApi(
        url: AppUrls.getFriendsRquestList,
        mapData: {"token": UserController.instance.getToken}).then((value) {
      // print(value);
      FriendRequestController.instance
          .friendRequestFun(FirendModel.fromJson(value));
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
