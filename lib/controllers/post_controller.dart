import 'package:get/get.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/post_repo.dart';

class PostController extends GetxController {
  static PostController instance = Get.find<PostController>();

  List<PostModel> allPostList = [];
  List<PostModel> allFriendsPostList = [];

  String? erroMessage;
  late bool isUser;
  late int index;

  addPost(PostModel post) {
    allPostList.add(post);
    update();
  }

  addFirendsPost(PostModel post) {
    allFriendsPostList.add(post);
    update();
  }

  setError(String error) {
    erroMessage = error;
    update();
  }

  clearAllData() {
    erroMessage = null;
    allPostList.clear();
  }

  // Like Post fun
  likePost({required int postId}) async {
    await PostRepository.instance.addPostLike(postId: postId).then((v) {
      for (var element in allPostList) {
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
    PostModel postData = allPostList.where((element) {
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
    PostModel postData = allPostList.where((element) {
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
