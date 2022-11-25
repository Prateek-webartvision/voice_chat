import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostRepository {
  static PostRepository instance = PostRepository();

  //get All Posts
  Future getAllPost() async {
    // print("Get Post");
    PostController.instance.clearAllData();

    var data = await ApiServices.getApi(url: AppUrls.getAllPost).then((value) {
      if (value['status'] == true) {
        for (var element in value['data']) {
          PostController.instance.addPost(PostModel.formJson(element));
        }
      } else {
        AppUtils.showSnakBar(msg: value['msg']);
        PostController.instance.setError(value['msg']);
      }
    }).onError((error, stackTrace) {
      AppUtils.showSnakBar(msg: error.toString());
      PostController.instance.setError(error.toString());
    });
    return data;
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
    ApiServices.postApi(url: AppUrls.removePost, mapData: removePostData)
        .then((value) {
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
    }).then((value) {
      AppUtils.closeDailog();
      if (value['status'] == true) {
        PostController.instance
            .removeCommentPost(postId: postId, commentId: commentId);
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      } else {
        AppUtils.showSnakBar(msg: value['msg'], second: 2);
      }
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString(), second: 2);
    });
  }

  // add Comment to post
  Future addPostComment(
      {required int postId, required String postMessage}) async {
    AppUtils.progressDailog();
    Map<String, dynamic> commentData = {
      "postid": postId,
      "userid": UserController.instance.getId,
      "message": postMessage
    };

    var d = await ApiServices.postApi(
            url: AppUrls.addPostComment, mapData: commentData)
        .then((value) {
      print(value);
      if (value['status'] == true) {
        // print(value['data']);
        PostController.instance.addCommentPost(
            comment: PostCommentModel.fromJson(value['data']), postId: postId);
      } else {
        // status = false
        AppUtils.showSnakBar(msg: value["msg"]);
      }
      AppUtils.closeDailog();
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

    Map<String, dynamic> likeData = {
      "postid": postId,
      "userid": UserController.instance.getId
    };
    var value =
        await ApiServices.postApi(url: AppUrls.addPostlike, mapData: likeData)
            .then((value) {
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
