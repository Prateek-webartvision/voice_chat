import 'package:get/get.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/models/friends_models/friend_profile_model.dart';
import 'package:voice_chat/models/post_model.dart';

class FriendProfileController extends GetxController {
  static FriendProfileController instance = Get.find<FriendProfileController>();

  ApiStatusEnum apiStatus = ApiStatusEnum.loading;
  String? error;
  FriendProfileModel? friendProfile;

  List<FriendProfilePostModel>? friendProfilePostList;

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

  addPostList(List<FriendProfilePostModel> postModelList) {
    friendProfilePostList = postModelList;
    print("list profile post");
    update();
  }

  postLike(bool val, int postId) {
    var post = friendProfilePostList!.where(
      (element) {
        if (element.id == postId) {
          return true;
        } else {
          return false;
        }
      },
    ).first;

    post.isLiked = val;
    if (val == true) {
      post.likesCount = post.likesCount + 1;
    } else {
      post.likesCount = post.likesCount - 1;
    }
    update();
  }

  //Post comment
  addCommentPost({required PostCommentModel comment, required int postId}) {
    var postData = friendProfilePostList!.where((element) {
      if (element.id == postId) {
        return true;
      } else {
        return false;
      }
    }).first;
    postData.comments.add(comment);
    postData.commentCount = postData.comments.length;
    // postData.
    update();
    // print("${comment.message} $postId ${postData.comments}");
  }

  // post comment remove
  removeCommentPost({required int postId, required String commentId}) {
    var postData = friendProfilePostList!.where((element) {
      if (element.id == postId) {
        return true;
      } else {
        return false;
      }
    }).first;

    PostCommentModel commentModel = postData.comments.where(
      (element) {
        if (element.commentId == commentId) {
          return true;
        } else {
          return false;
        }
      },
    ).first;

    postData.comments.remove(commentModel);
    postData.commentCount = postData.comments.length;
    update();
  }
}
