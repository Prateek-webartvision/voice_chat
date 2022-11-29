import 'package:get/get.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/post_repo.dart';

class PostFriendsController extends GetxController {
  static PostFriendsController instance = Get.find<PostFriendsController>();

  List<PostModel> allFriendsPostList = [];
  String? erroMessage;

  ApiStatusEnum postEnum = ApiStatusEnum.loading;

  setPostStatus(ApiStatusEnum postEnum) {
    this.postEnum = postEnum;
    update();
  }

  setError(String error) {
    erroMessage = error;
    update();
  }

  addPost(PostModel post) {
    allFriendsPostList.add(post);
    update();
  }

  likePost({required int postId}) async {
    await PostRepository.instance.addPostLike(postId: postId).then((v) {
      for (var element in allFriendsPostList) {
        if (element.id == postId) {
          if (element.isLiked == true) {
            // print(true);
            element.isLiked = false;
            element.likeCount = element.likeCount - 1;
          } else {
            // print(false);
            element.isLiked = true;
            element.likeCount = element.likeCount + 1;
          }
        }
      }
    });
    update();
  }

  //Post comment
  addCommentPost({required PostCommentModel comment, required int postId}) {
    PostModel postData = allFriendsPostList.where((element) {
      if (element.id == postId) {
        return true;
      } else {
        return false;
      }
    }).first;
    postData.comments.add(comment);
    // postData.
    update();
    // print("${comment.message} $postId ${postData.comments}");
  }

  // post comment remove
  removeCommentPost({required int postId, required String commentId}) {
    PostModel postData = allFriendsPostList.where((element) {
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
    update();
  }
}
