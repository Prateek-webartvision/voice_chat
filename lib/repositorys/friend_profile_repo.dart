import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/friends_models/friend_profile_model.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class FriendProfileRepository {
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

  //  get post by user id
  static getPostByUserId(int userId) async {
    List<FriendProfilePostModel> val = [];
    // print(userId);
    await ApiServices.postApi(url: AppUrls.getPostByUserId, mapData: {
      "userid": userId,
    }).then((value) {
      if (value['status'] == true) {
        for (var element in value['data']) {
          val.add(FriendProfilePostModel.fromJson(element));
        }
        FriendProfileController.instance.addPostList(val);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  // add Comment to post
  static Future addPostComment({required int postId, required String postMessage}) async {
    AppUtils.progressDailog();

    Map<String, dynamic> commentData = {
      "postid": postId,
      // "userid": UserController.instance.getId,
      "token": UserController.instance.getToken,
      "message": postMessage
    };

    var d = await ApiServices.postApi(url: AppUrls.addPostComment, mapData: commentData).then((value) {
      // print(value);
      AppUtils.closeDailog();
      if (value['status'] == true) {
        // print(value['data']);
        FriendProfileController.instance.addCommentPost(comment: PostCommentModel.fromJson(value['data']), postId: postId);
      } else {
        // status = false
        AppUtils.showSnakBar(msg: value["msg"]);
      }

      return value;
    }).onError((error, stackTrace) {
      // print(error);
      AppUtils.showSnakBar(msg: error.toString());
      AppUtils.closeDailog();
      return null;
    });

    return d; // print(commentData);
  }

  // Remove comment from post
  static removeComment({required String commentId, required int postId}) {
    // print("$commentId $postId");
    AppUtils.progressDailog();
    ApiServices.postApi(url: AppUrls.remocePostComment, mapData: {
      "postid": postId,
      "commentid": commentId,
      "token": UserController.instance.getToken,
    }).then((value) {
      print(value);
      AppUtils.closeDailog();
      if (value['status'] == true) {
        FriendProfileController.instance.removeCommentPost(postId: postId, commentId: commentId);
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
      print(value);
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }
}
