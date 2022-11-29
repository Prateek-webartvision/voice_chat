import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_friends_controller.dart';
import 'package:voice_chat/controllers/post_suggested_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostRepository {
  static PostRepository instance = PostRepository();
  static final PostSuggestedController _postController = PostSuggestedController.instance;
  static final PostFriendsController _postFriendsController = PostFriendsController.instance;

  //get All Posts
  Future getAllPost() async {
    print("post call");
    _postController.setPostStatus(ApiStatusEnum.loading);
    _postController.allPostList.clear();
    await ApiServices.getApi(url: AppUrls.getAllPost).then((value) {
      if (value['status'] == true) {
        _postController.setPostStatus(ApiStatusEnum.success);
        // print("Post s:  $value");
        for (var element in value['data']) {
          _postController.addPost(PostModel.formJson(element));
        }
      } else {
        _postController.setPostStatus(ApiStatusEnum.error);
        _postController.setError(value['msg']);
      }
      // print(value);
    }).onError((error, stackTrace) {
      _postController.setPostStatus(ApiStatusEnum.error);
      _postController.setError(error.toString());
    });
  }

  // get All friends Posts
  Future grtAllFriendsPost() async {
    print("post f call");
    _postFriendsController.setPostStatus(ApiStatusEnum.loading);
    _postFriendsController.allFriendsPostList.clear();

    await ApiServices.postApi(url: AppUrls.getMyFriendsPost, mapData: {"token": UserController.instance.getToken}).then((value) {
      if (value['status'] == true) {
        _postFriendsController.setPostStatus(ApiStatusEnum.success);
        for (var element in value['data']) {
          _postFriendsController.addPost(PostModel.formJson(element));
        }
      } else {
        _postFriendsController.setPostStatus(ApiStatusEnum.error);
        _postFriendsController.setError(value['msg']);
      }
      // print(value);
    }).onError((error, stackTrace) {
      _postFriendsController.setPostStatus(ApiStatusEnum.error);
      _postFriendsController.setError(error.toString());
    });
  }

  // Create new Post
  createNewPost({String? postMessage, String? tag, String? image}) {
    if (postMessage!.isNotEmpty || image != null) {
      AppUtils.progressDailog();
      ApiServices.multifilePost(
        url: AppUrls.createPost,
        mapData: {
          "token": UserController.instance.getToken,
          "body": postMessage,
          "title": "dsadsa",
        },
        imageData: (image != null)
            ? {
                "key": "post_image",
                "path": image,
              }
            : null,
      ).then((value) {
        AppUtils.closeDailog();
        Get.back();
        AppUtils.showSnakBar(msg: value['msg']);
        getAllPost();
      }).onError((error, stackTrace) {
        AppUtils.closeDailog();
        AppUtils.showSnakBar(msg: error.toString());
      });
    } else {
      AppUtils.showSnakBar(msg: "Type your moment or add picture", second: 2);
    }
  }

  //remove Post
  Future removePost({required int postId}) async {
    Map<String, dynamic> removePostData = {
      "token": UserController.instance.getToken,
      "postid": postId,
    };
    // print(removePostData);
    AppUtils.progressDailog();
    ApiServices.postApi(url: AppUrls.removePost, mapData: removePostData).then((value) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: value['msg']);
      getAllPost();
      print(value);
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString());
      print(error);
    });
  }

  // Remove comment from post
  removeComment({required String commentId, required int postId}) {
    // print("$commentId $postId");
    AppUtils.progressDailog();
    ApiServices.postApi(url: AppUrls.remocePostComment, mapData: {
      "postid": postId,
      "commentid": commentId,
      "token": UserController.instance.getToken,
    }).then((value) {
      AppUtils.closeDailog();
      if (value['status'] == true) {
        PostSuggestedController.instance.removeCommentPost(postId: postId, commentId: commentId);
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
      // print(value);
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  // Remove comment from post
  removeFriendsPostComment({required String commentId, required int postId}) {
    // print("$commentId $postId");
    AppUtils.progressDailog();
    ApiServices.postApi(url: AppUrls.remocePostComment, mapData: {
      "postid": postId,
      "commentid": commentId,
      "token": UserController.instance.getToken,
    }).then((value) {
      AppUtils.closeDailog();
      // print(value);
      if (value['status'] == true) {
        PostFriendsController.instance.removeCommentPost(postId: postId, commentId: commentId);
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
      //   // print(value);
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  // add Comment to post
  Future addPostComment({required int postId, required String postMessage}) async {
    AppUtils.progressDailog();

    Map<String, dynamic> commentData = {
      "postid": postId,
      // "userid": UserController.instance.getId,
      "token": UserController.instance.getToken,
      "message": postMessage
    };

    var d = await ApiServices.postApi(url: AppUrls.addPostComment, mapData: commentData).then((value) {
      print(value);
      AppUtils.closeDailog();
      if (value['status'] == true) {
        // print(value['data']);
        PostSuggestedController.instance.addCommentPost(comment: PostCommentModel.fromJson(value['data']), postId: postId);
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

  // add Comment to post
  Future addPostFriendsComment({required int postId, required String postMessage}) async {
    AppUtils.progressDailog();

    Map<String, dynamic> commentData = {
      "postid": postId,
      // "userid": UserController.instance.getId,
      "token": UserController.instance.getToken,
      "message": postMessage
    };

    var d = await ApiServices.postApi(url: AppUrls.addPostComment, mapData: commentData).then((value) {
      print(value);
      AppUtils.closeDailog();
      if (value['status'] == true) {
        // print(value['data']);
        _postFriendsController.addCommentPost(comment: PostCommentModel.fromJson(value['data']), postId: postId);
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

  //Like post
  Future addPostLike({required int postId}) async {
    AppUtils.progressDailog();

    Map<String, dynamic> likeData = {"postid": postId, "userid": UserController.instance.getId};
    var value = await ApiServices.postApi(url: AppUrls.addPostlike, mapData: likeData).then((value) {
      AppUtils.closeDailog();
      return value;
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString());
      AppUtils.closeDailog();
      return null;
    });

    return value;
  }
}
